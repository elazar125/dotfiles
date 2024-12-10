-- [[ Setting options ]]
-- See `:help vim.opt`

vim.opt.termguicolors = true

-- Set highlight on search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Wordwrap
vim.opt.wrap = false

-- Spell check (modern neovim skips spell-checking code by default)
vim.opt.spell = true

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- Don't show '--Insert--' in the message bar when inserting
vim.opt.showmode = false

-- Don't show number of chars/lines in the bottom in Visual mode
vim.opt.showcmd = false

-- Split in the direction I expect
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Set global status bar (not one per window)
vim.opt.laststatus = 0
vim.opt.statusline = ' '

-- Remove the  ~'s from the end of files
vim.opt.fillchars = 'eob: '

-- always show the sign column so things don't jump when errors are reported
vim.opt.signcolumn = 'yes'

-- Set default indentation
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

-- Stop using shada since it just seems to cause problems without much value
vim.opt.shadafile = "NONE"

if vim.fn.has('win32') then
  vim.opt.shell = 'bash.exe'
  vim.opt.shellcmdflag = '-c'
  vim.opt.shellredir = '>%s 2>&1'
  vim.opt.shellpipe = '2>&1| tee'
  vim.opt.shellquote = ''
  vim.opt.shellxescape = ''
  vim.opt.shellxquote = ''
  vim.fn.setenv('TMP', '/tmp')
end
