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
  event = "VeryLazy",
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
    require('lspconfig').tsserver.setup({
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
  end
}
