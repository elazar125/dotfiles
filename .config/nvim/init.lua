--[[

My Neovim Config

This file just sets up the Lazy package manager,
and pulls in other files for the rest of the config.
Almost everything is in ./lua, except a few
language-specific things in ./after/ftplugin

This was initially built on Kickstart.nvim, I highly
recommend starting with that and branching out on your own!

--]]

--[[
Set <space> as the leader key (see `:help mapleader`)
NOTE: Must happen before plugins are required, otherwise wrong leader will be used
--]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--[[
Install package manager
  https://github.com/folke/lazy.nvim
  `:help lazy.nvim.txt` for more info
--]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Install all the plugins (defined in files in ./lua/plugins)
require('lazy').setup({
  import = "plugins",
  defaults = {
    lazy =  true,
  },
}, {})

-- Load non-plugin files
require("settings")
require("keymaps")
require("autocmds")

-- Load colour scheme from ./colors
vim.cmd 'colorscheme base16-atelier-cave'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
