return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp' },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    require('luasnip.loaders.from_vscode').lazy_load()
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      window = {
        completion = cmp.config.window.bordered({
          scrollbar = false,
          winhighlight = 'Normal:Normal,FloatBorder:None,CursorLine:Visual,Search:None',
        }),
        documentation = cmp.config.window.bordered({
          scrollbar = false,
          winhighlight = 'Normal:Normal,FloatBorder:None,CursorLine:Visual,Search:None',
        }),
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      },
    }
  end,
  event = 'InsertEnter',
}
