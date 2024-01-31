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

  -- 'kamykn/CCSpellCheck.vim', -- TODO: This isn't working

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {}, keys = 'gc' },

  -- Add fun icons
  'nvim-tree/nvim-web-devicons',

  -- Show inline git blame
  -- Not lazy loaded, something about it causes issues
  'tveskag/nvim-blame-line',
}
