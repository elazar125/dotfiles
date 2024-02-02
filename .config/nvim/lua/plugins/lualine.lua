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

local colours = require('colours')

local colours = {
  command = { a = { fg = colours.gui01, bg = colours.gui08 } },
  insert = { a = { fg = colours.gui01, bg = colours.gui0B } },
  replace = { a = { fg = colours.gui01, bg = colours.gui0E } },
  terminal = { a = { fg = colours.gui01, bg = colours.gui09 } },
  visual = { a = { fg = colours.gui01, bg = colours.gui0F } },
  inactive = { c = { fg = colours.gui05, bg = colours.gui00 } },
  normal = { a = { fg = colours.gui01, bg = colours.gui0D }, c = { fg = colours.gui05, bg = colours.gui01 } }
}

return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = true,
      theme = colours,
      component_separators = '',
      section_separators = { left = '', right = ''},
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
