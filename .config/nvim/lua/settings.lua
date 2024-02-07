-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true
vim.o.incsearch = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Wordwrap
vim.o.wrap = false

-- Spell check (modern neovim skips spell-checking code by default)
vim.o.spell = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
-- vim.opt.shortmess:append('c')

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Don't show "--Insert--" in the message bar when inserting
vim.o.showmode = false

-- Don't show number of chars/lines in the bottom in Visual mode
vim.o.showcmd = false

-- Split in the direction I expect
vim.o.splitbelow = true
vim.o.splitright = true

-- Set global status bar (not one per window)
vim.o.laststatus = 3

-- Remove the  ~'s from the end of files
vim.o.fillchars = "eob: "
