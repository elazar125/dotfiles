return {
  'navarasu/onedark.nvim',
  priority = 1000,
  opts = function()
    vim.cmd.colorscheme 'onedark'
    return {
      style = 'darker',
      transparent = true,
    }
  end,
}
