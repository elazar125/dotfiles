return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

    -- Enable Go to Definition for external packages in C#
    'Hoffs/omnisharp-extended-lsp.nvim'
  },
  event = 'BufReadPost',
  config = function()
    -- [[ Configure LSP ]]
    --  This function gets run when an LSP connects to a particular buffer.

    -- Setup neovim lua configuration
    -- require('neodev').setup()
    require('mason').setup()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      ['powershell-editor-services'] = {},
      ['vue-language-server'] = {},
      ['html-lsp'] = {},
      ['typescript-language-server'] = {
        init_options = {
          plugins = {
            -- Use typescript language server along with vue typescript plugin
            {
              name = '@vue/typescript-plugin',
              location = require('mason-registry')
                          .get_package('vue-language-server')
                          :get_install_path() .. '/node_modules/@vue/language-server',
              languages = { 'vue' },
            },
          },
        },
        filetypes = {
          'javascript',
          'typescript',
          'vue',
        },
      },
      ['lua-language-server'] = {},
      ['gopls'] = {},
      ['omnisharp'] = {
        -- Specifies whether 'using' directives should be grouped and sorted during
        -- document formatting.
        organize_imports_on_format = true,

        -- Enables support for showing unimported types and unimported extension
        -- methods in completion lists. When committed, the appropriate using
        -- directive will be added at the top of the current file. This option can
        -- have a negative impact on initial completion responsiveness,
        -- particularly for the first few completion sessions after opening a
        -- solution.
        enable_import_completion = true,

        -- Enable Go To Definition for external files
        handlers = {
          ['textDocument/definition'] = require('omnisharp_extended').handler,
        },
      },
      -- ['sqlls'] = {},
      ['css-lsp'] = {},
      ['bash-language-server'] = {},
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'netcoredbg',
    })
    require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

    require('mason-lspconfig').setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for ts_ls)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    })
  end
}
