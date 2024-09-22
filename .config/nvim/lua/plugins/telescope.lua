-- Fuzzy Finder (files, lsp, etc)

-- Use a more complicated setup for make on Windows, as it doesn't have everything needed
make_command = 'make'
if vim.fn.has('win32') then
  make_command = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
end

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
      build = make_command
    }
  },
  config = function ()
    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ['<esc>'] = require('telescope.actions').close,
          },
        },
      },
      pickers = {
        -- Use fd instead of the default as it gets all files (including hidden) except .git/
        find_files = {
          find_command = { 'fd', '--type', 'f' },
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
