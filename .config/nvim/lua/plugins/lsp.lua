return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    -- 'folke/neodev.nvim',
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
    require('lspconfig').gopls.setup({
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
