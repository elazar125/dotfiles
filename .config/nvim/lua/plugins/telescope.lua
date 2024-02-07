-- Fuzzy Finder (files, lsp, etc)
return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  config = function ()
    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = require("telescope.actions").close,
          },
        },
      },
      pickers = {
        -- Use fd instead of the default as it gets all files (including hidden) except .git/
        find_files = {
          find_command = { "fd", "--type", "f" },
          hidden = true,
        },
        -- Use a theme that only displays file contents once, in order
        current_buffer_fuzzy_find = require('telescope.themes').get_dropdown {
          previewer = false,
        },
      },
    })
    require('telescope').load_extension('fzf')
  end,
  cmd = 'Telescope',
}
