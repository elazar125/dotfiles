-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Here is where you install your plugins.
require('lazy').setup({
  defaults = {
    lazy =  true,
  },

  require("plugins.colourscheme").settings,

  -- Floating command prompt
  require("plugins.noice"),

  -- LSP language features
  require("plugins.lsp").settings,

  -- Completions
  require("plugins.cmp").settings,

  -- Status line
  require("plugins.lualine"),

  -- Syntax highlighting and syntax-aware navigation
  require("plugins.treesitter").settings,

  -- Fuzzy find anything
  require("plugins.telescope"),

  -- Dim inactive code for presentations
  { 'folke/twilight.nvim', cmd = { 'Twilight', 'TwilightEnable' } },

  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth', event = { 'BufReadPre', 'BufNewFile' } },

  -- Surround a textobject with a pair of characters
  { 'tpope/vim-surround', keys = { 'ys', 'cs', 'ds' } },

  -- Use ctrl+n to select the next instance of text
  { 'mg979/vim-visual-multi', keys = '<C-n>' },

  { 'chaoren/vim-wordmotion', event = { 'BufReadPre', 'BufNewFile' } },
  -- 'kamykn/CCSpellCheck.vim', -- TODO: This isn't working

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {}, event = 'VeryLazy' },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {}, keys = 'gc' },

  -- Add fun icons
  'nvim-tree/nvim-web-devicons',
}, {})

require("settings")
require("keymaps")

require("plugins.colourscheme").setup()
require("plugins.treesitter").setup()
require("plugins.lsp").setup()
require("plugins.cmp").setup()

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufEnter", "BufWinEnter"}, {
  pattern = "*.md",
  command = "set spell wrap",
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
