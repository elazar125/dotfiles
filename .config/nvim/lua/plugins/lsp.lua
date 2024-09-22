return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    -- 'folke/neodev.nvim',

    -- Enable Go to Definition for external packages in C#
    'Hoffs/omnisharp-extended-lsp.nvim'
  },
  event = 'BufReadPost',
  config = function()
    -- [[ Configure LSP ]]
    --  This function gets run when an LSP connects to a particular buffer.

    -- Setup neovim lua configuration
    -- require('neodev').setup()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- rust_analyzer = {},
    -- require('lspconfig').lua_ls.setup({
    --   capabilities = capabilities,
    --   settings = {
    --     Lua = {
    --       workspace = { checkThirdParty = false },
    --       telemetry = { enable = false },
    --     },
    --   }
    -- })
    require('lspconfig').omnisharp.setup({
      cmd = { 'dotnet', '~/.config/dependencies/omnisharp/OmniSharp.dll' },
      capabilities = capabilities,

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
    })
    require('lspconfig').powershell_es.setup({
      bundle_path = '~/.config/dependencies/powershell-es/',
      capabilities = capabilities,
    })
    require('lspconfig').html.setup({
      capabilities = capabilities,
    })
    require('lspconfig').cssls.setup({
      capabilities = capabilities,
    })
    require('lspconfig').bashls.setup({
      capabilities = capabilities,
    })
    require('lspconfig').volar.setup({
      capabilities = capabilities,
      init_options = {
        typescript = {
          tsdk = '/usr/lib/node_modules/typescript/lib/',
        },
      },
    })
    -- Volar 2.0 has discontinued their "take over mode" which in previous version provided support for typescript in vue files.
    -- The new approach to get typescript support involves using the typescript language server along side volar.
    require('lspconfig').ts_ls.setup({
      init_options = {
        plugins = {
          -- Use typescript language server along with vue typescript plugin
          {
            name = "@vue/typescript-plugin",
            location = '/usr/lib/node_modules/@vue/typescript-plugin/',
            languages = { "javascript", "typescript", "vue" },
          },
        },
      },
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "vue",
      },
    })
  end
}
