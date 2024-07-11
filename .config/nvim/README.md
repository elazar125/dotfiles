# Neovim - Vim but forked for some different features

I went with Neovim over classic Vim for a few reasons
- Built-in LSP
- Built-in Treesitter
- Seems like all the cool kids are doing it online

Also using Lua instead of vimscript seems nice.

If you're starting out on Vim, I'd recommend you try Helix first, it's an easier tool to learn but not as flexible (see $XDG_CONFIG_HOME/helix/README.md).

If you feel ready to start using Neovim, start with [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). That's what I did and it was a huge help. Also, [this YouTube playlist](https://youtube.com/playlist?list=PLep05UYkc6wTWlugE_9Lj6JlLpvSBbkZ_&si=GCPqErSKQ9EI4iRT) was incredibly useful.

Because I'm using almost exclusively Lua for my config, I have he vast majority of the code in `./lua`. You'll see it get `require()`'d in `init.lua` as needed, or loaded by lazy.nvim from `./lua/plugins`.
