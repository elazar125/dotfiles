return {
  -- Dim inactive code for presentations
  { 'folke/twilight.nvim', cmd = { 'Twilight', 'TwilightEnable' } },

  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth', event = { 'BufReadPre', 'BufNewFile' } },

  -- Surround a textobject with a pair of characters
  { 'tpope/vim-surround', keys = { 'ys', 'cs', 'ds' } },

  -- Use ctrl+n to select the next instance of text
  { 'mg979/vim-visual-multi', keys = '<C-n>' },

  -- Move in sub-words (camelCase snake_case etc.)
  { 'chaoren/vim-wordmotion', keys = { '\\' } },

  -- Add fun icons
  'nvim-tree/nvim-web-devicons',

  { 'APZelos/blamer.nvim', cmd = 'BlamerToggle' },

  { 'chrisgrieser/nvim-spider', opts = {}, event = 'VeryLazy' },

  { 'chrisgrieser/nvim-various-textobjs', event = 'VeryLazy', opts = { keymaps = { useDefaults = true } }, },

  { 'nacro90/numb.nvim', event = 'VeryLazy', opts = { show_cursorline = false } },
}
