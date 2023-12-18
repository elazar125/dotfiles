-- mode icon map
local mode_map = {
  ['NORMAL'] = '',
  ['O-PENDING'] = 'N?',
  ['INSERT'] = '󰙏',
  ['VISUAL'] = '󰘎',
  ['V-BLOCK'] = '󰘎',
  ['V-LINE'] = '󰘎',
  ['V-REPLACE'] = '󰘎',
  ['REPLACE'] = 'R',
  ['COMMAND'] = '',
  ['SHELL'] = '',
  ['TERMINAL'] = 'T',
  ['EX'] = 'X',
  ['S-BLOCK'] = 'SB',
  ['S-LINE'] = 'SL',
  ['SELECT'] = 'S',
  ['CONFIRM'] = 'Y?',
  ['MORE'] = 'M',
}

return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = true,
      theme = 'onedark',
      component_separators = '',
      section_separators = { left = '', right = ''},
    },
    sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'buffers'},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {{'mode', fmt = function(s) return mode_map[s] or s end}},
    }
  },
  event = { 'BufReadPre', 'BufNewFile' },
}
