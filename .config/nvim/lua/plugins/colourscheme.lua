local M = {}

M.settings = {
  'navarasu/onedark.nvim',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'onedark'
  end,
}

function M.setup()
  require('onedark').setup {
    style = 'darker',
    transparent = true
  }
  require('onedark').load()
end

return M
