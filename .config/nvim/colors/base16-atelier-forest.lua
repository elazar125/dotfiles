-- base16-nvim (https://github.com/wincent/base16-nvim)
-- by Greg Hurrell (https://github.com/wincent)
-- based on
-- base16-vim (https://github.com/chriskempson/base16-vim)
-- by Chris Kempson (https://github.com/chriskempson)
-- Atelier Forest scheme by Bram de Haan (http://atelierbramdehaan.nl)

local colours = require('colours')

vim.cmd [[
  highlight clear
  syntax reset
]]
vim.g.colors_name = "base16-atelier-forest"

-- Vim editor colors                    fg bg ctermfg ctermbg attr guisp
vim.api.nvim_set_hl(0, 'Normal', { fg = colours.gui05, bg = nil, ctermfg = colours.cterm05, ctermbg = colours.cterm00 })
vim.api.nvim_set_hl(0, 'Bold', { bold = true })
vim.api.nvim_set_hl(0, 'Debug', { fg = colours.gui08, ctermfg = colours.cterm08 })
vim.api.nvim_set_hl(0, 'Directory', { fg = colours.gui0D, ctermfg = colours.cterm0D })
vim.api.nvim_set_hl(0, 'Error', { fg = colours.gui00, bg = colours.gui08, ctermfg = colours.cterm00, ctermbg = colours.cterm08 })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = colours.gui08, bg = colours.gui00, ctermfg = colours.cterm08, ctermbg = colours.cterm00 })
vim.api.nvim_set_hl(0, 'Exception', { fg = colours.gui08, ctermfg = colours.cterm08 })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = colours.gui0C, bg = colours.gui01, ctermfg = colours.cterm0C, ctermbg = colours.cterm01 })
vim.api.nvim_set_hl(0, 'Folded', { fg = colours.gui03, bg = colours.gui01, ctermfg = colours.cterm03, ctermbg = colours.cterm01 })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = colours.gui01, bg = colours.gui09, ctermfg = colours.cterm01, ctermbg = colours.cterm09 })
vim.api.nvim_set_hl(0, 'Italic', {})
vim.api.nvim_set_hl(0, 'Macro', { fg = colours.gui08, ctermfg = colours.cterm08 })
vim.api.nvim_set_hl(0, 'MatchParen', { bg = colours.gui03, ctermbg = colours.cterm03 })
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = colours.gui0B, ctermfg = colours.cterm0B })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = colours.gui0B, ctermfg = colours.cterm0B })
vim.api.nvim_set_hl(0, 'Question', { fg = colours.gui0D, ctermfg = colours.cterm0D })
vim.api.nvim_set_hl(0, 'Search', { fg = colours.gui01, bg = colours.gui0A, ctermfg = colours.cterm01, ctermbg = colours.cterm0A })
vim.api.nvim_set_hl(0, 'Substitute', { fg = colours.gui01, bg = colours.gui0A, ctermfg = colours.cterm01, ctermbg = colours.cterm0A })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = colours.gui03, ctermfg = colours.cterm03 })
vim.api.nvim_set_hl(0, 'TooLong', { fg = colours.gui08, ctermfg = colours.cterm08 })
vim.api.nvim_set_hl(0, 'Underlined', { fg = colours.gui08, ctermfg = colours.cterm08 })
vim.api.nvim_set_hl(0, 'Visual', { bg = colours.gui02, ctermbg = colours.cterm02 })
vim.api.nvim_set_hl(0, 'VisualNOS', { fg = colours.gui08, ctermfg = colours.cterm08 })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = colours.gui08, ctermfg = colours.cterm08 })
vim.api.nvim_set_hl(0, 'WildMenu', { fg = colours.gui08, bg = colours.gui0A, ctermfg = colours.cterm08 })
vim.api.nvim_set_hl(0, 'Title', { fg = colours.gui0D, ctermfg = colours.cterm0D })
vim.api.nvim_set_hl(0, 'Conceal', { fg = colours.gui0D, bg = colours.gui00, ctermfg = colours.cterm0D, ctermbg = colours.cterm00 })
vim.api.nvim_set_hl(0, 'Cursor', { fg = colours.gui00, bg = colours.gui05, ctermfg = colours.cterm00, ctermbg = colours.cterm05 })
vim.api.nvim_set_hl(0, 'NonText', { fg = colours.gui03, ctermfg = colours.cterm03 })
vim.api.nvim_set_hl(0, 'LineNr', { fg = colours.gui03, bg = nil, ctermfg = colours.cterm03, ctermbg = colours.cterm01 })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = colours.gui03, bg = nil, ctermfg = colours.cterm03, ctermbg = colours.cterm01 })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = colours.gui04, bg = colours.gui02, ctermfg = colours.cterm04, ctermbg = colours.cterm02 })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = colours.gui03, bg = colours.gui01, ctermfg = colours.cterm03, ctermbg = colours.cterm01 })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = colours.gui02, bg = nil, ctermfg = colours.cterm02, ctermbg = colours.cterm02 })
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = colours.gui01, ctermbg = colours.cterm01 })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = colours.gui01, ctermbg = colours.cterm01 })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = colours.gui01, ctermbg = colours.cterm01 })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = colours.gui04, bg = colours.gui01, ctermfg = colours.cterm04, ctermbg = colours.cterm01 })
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = colours.gui01, ctermbg = colours.cterm01 })
vim.api.nvim_set_hl(0, 'PMenu', { fg = colours.gui05, bg = colours.gui01, ctermfg = colours.cterm05, ctermbg = colours.cterm01 })
vim.api.nvim_set_hl(0, 'PMenuSel', { fg = colours.gui01, bg = colours.gui05, ctermfg = colours.cterm01, ctermbg = colours.cterm05 })
vim.api.nvim_set_hl(0, 'TabLine', { fg = colours.gui03, bg = colours.gui01, ctermfg = colours.cterm03, ctermbg = colours.cterm01 })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = colours.gui03, bg = colours.gui01, ctermfg = colours.cterm03, ctermbg = colours.cterm01 })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = colours.gui0B, bg = colours.gui01, ctermfg = colours.cterm0B, ctermbg = colours.cterm01 })

-- Standard syntax highlighting
vim.api.nvim_set_hl(0, 'Boolean', { fg = colours.gui09, ctermfg = colours.cterm09 })
vim.api.nvim_set_hl(0, 'Character', { fg = colours.gui08, ctermfg = colours.cterm08 })
vim.api.nvim_set_hl(0, 'Comment', { fg = colours.gui03, ctermfg = colours.cterm03 })
vim.api.nvim_set_hl(0, 'Conditional', { fg = colours.gui0E, ctermfg = colours.cterm0E })
vim.api.nvim_set_hl(0, 'Constant', { fg = colours.gui09, ctermfg = colours.cterm09 })
vim.api.nvim_set_hl(0, 'Define', { fg = colours.gui0E, ctermfg = colours.cterm0E })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = colours.gui0F, ctermfg = colours.cterm0F })
vim.api.nvim_set_hl(0, 'Float', { fg = colours.gui09, ctermfg = colours.cterm09 })
vim.api.nvim_set_hl(0, 'Function', { fg = colours.gui0D, ctermfg = colours.cterm0D })
vim.api.nvim_set_hl(0, 'Identifier', { fg = colours.gui08, ctermfg = colours.cterm08 })
vim.api.nvim_set_hl(0, 'Include', { fg = colours.gui0D, ctermfg = colours.cterm0D })
vim.api.nvim_set_hl(0, 'Keyword', { fg = colours.gui0E, ctermfg = colours.cterm0E })
vim.api.nvim_set_hl(0, 'Label', { fg = colours.gui0A, ctermfg = colours.cterm0A })
vim.api.nvim_set_hl(0, 'Number', { fg = colours.gui09, ctermfg = colours.cterm09 })
vim.api.nvim_set_hl(0, 'Operator', { fg = colours.gui05, ctermfg = colours.cterm05 })
vim.api.nvim_set_hl(0, 'PreProc', { fg = colours.gui0A, ctermfg = colours.cterm0A })
vim.api.nvim_set_hl(0, 'Repeat', { fg = colours.gui0A, ctermfg = colours.cterm0A })
vim.api.nvim_set_hl(0, 'Special', { fg = colours.gui0C, ctermfg = colours.cterm0C })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = colours.gui0F, ctermfg = colours.cterm0F })
vim.api.nvim_set_hl(0, 'Statement', { fg = colours.gui0E, ctermfg = colours.cterm0E })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = colours.gui0A, ctermfg = colours.cterm0A })
vim.api.nvim_set_hl(0, 'String', { fg = colours.gui0B, ctermfg = colours.cterm0B })
vim.api.nvim_set_hl(0, 'Structure', { fg = colours.gui0E, ctermfg = colours.cterm0E })
vim.api.nvim_set_hl(0, 'Tag', { fg = colours.gui0A, ctermfg = colours.cterm0A })
vim.api.nvim_set_hl(0, 'Todo', { fg = colours.gui0A, bg = colours.gui01, ctermfg = colours.cterm0A, ctermbg = colours.cterm01 })
vim.api.nvim_set_hl(0, 'Type', { fg = colours.gui0A, ctermfg = colours.cterm0A })
vim.api.nvim_set_hl(0, 'Typedef', { fg = colours.gui0A, ctermfg = colours.cterm0A })

-- C highlighting
vim.api.nvim_set_hl(0, 'cOperator', { fg = colours.gui0C, ctermfg = colours.cterm0C })
vim.api.nvim_set_hl(0, 'cPreCondit', { fg = colours.gui0E, ctermfg = colours.cterm0E })

-- C# highlighting
vim.api.nvim_set_hl(0, 'csClass', { fg = colours.gui0A, ctermfg = colours.cterm0A })
vim.api.nvim_set_hl(0, 'csAttribute', { fg = colours.gui0A, ctermfg = colours.cterm0A })
vim.api.nvim_set_hl(0, 'csModifier', { fg = colours.gui0E, ctermfg = colours.cterm0E })
vim.api.nvim_set_hl(0, 'csType', { fg = colours.gui08, ctermfg = colours.cterm08 })
vim.api.nvim_set_hl(0, 'csUnspecifiedStatement', { fg = colours.gui0D, ctermfg = colours.cterm0D })
vim.api.nvim_set_hl(0, 'csContextualStatement', { fg = colours.gui0E, ctermfg = colours.cterm0E })
vim.api.nvim_set_hl(0, 'csNewDecleration', { fg = colours.gui08, ctermfg = colours.cterm08 })

-- CSS highlighting
vim.api.nvim_set_hl(0, 'cssBraces', { fg = colours.gui05, ctermfg = colours.cterm05 })
vim.api.nvim_set_hl(0, 'cssClassName', { fg = colours.gui0E, ctermfg = colours.cterm0E })
vim.api.nvim_set_hl(0, 'cssColor', { fg = colours.gui0C, ctermfg = colours.cterm0C })

-- Diff highlighting
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = colours.gui0B, bg = colours.gui01, ctermfg =  colours.cterm0B, ctermbg = colours.cterm01 })
vim.api.nvim_set_hl(0, 'DiffChange', { fg = colours.gui03, bg = colours.gui01, ctermfg =  colours.cterm03, ctermbg = colours.cterm01 })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = colours.gui08, bg = colours.gui01, ctermfg =  colours.cterm08, ctermbg = colours.cterm01 })
vim.api.nvim_set_hl(0, 'DiffText', { fg = colours.gui0D, bg = colours.gui01, ctermfg =  colours.cterm0D, ctermbg = colours.cterm01 })
vim.api.nvim_set_hl(0, 'DiffAdded', { fg = colours.gui0B, bg = colours.gui00, ctermfg =  colours.cterm0B, ctermbg = colours.cterm00 })
vim.api.nvim_set_hl(0, 'DiffFile', { fg = colours.gui08, bg = colours.gui00, ctermfg =  colours.cterm08, ctermbg = colours.cterm00 })
vim.api.nvim_set_hl(0, 'DiffNewFile', { fg = colours.gui0B, bg = colours.gui00, ctermfg =  colours.cterm0B, ctermbg = colours.cterm00 })
vim.api.nvim_set_hl(0, 'DiffLine', { fg = colours.gui0D, bg = colours.gui00, ctermfg =  colours.cterm0D, ctermbg = colours.cterm00 })
vim.api.nvim_set_hl(0, 'DiffRemoved', { fg = colours.gui08, bg = colours.gui00, ctermfg =  colours.cterm08, ctermbg = colours.cterm00 })

-- Git highlighting
vim.api.nvim_set_hl(0, 'gitcommitOverflow', { fg = colours.gui08, ctermfg = colours.cterm08 })
vim.api.nvim_set_hl(0, 'gitcommitSummary', { fg = colours.gui0B, ctermfg = colours.cterm0B })
vim.api.nvim_set_hl(0, 'gitcommitComment', { fg = colours.gui03, ctermfg = colours.cterm03 })
vim.api.nvim_set_hl(0, 'gitcommitUntracked', { fg = colours.gui03, ctermfg = colours.cterm03 })
vim.api.nvim_set_hl(0, 'gitcommitDiscarded', { fg = colours.gui03, ctermfg = colours.cterm03 })
vim.api.nvim_set_hl(0, 'gitcommitSelected', { fg = colours.gui03, ctermfg = colours.cterm03 })
vim.api.nvim_set_hl(0, 'gitcommitHeader', { fg = colours.gui0E, ctermfg = colours.cterm0E })
vim.api.nvim_set_hl(0, 'gitcommitSelectedType', { fg = colours.gui0D, ctermfg = colours.cterm0D })
vim.api.nvim_set_hl(0, 'gitcommitUnmergedType', { fg = colours.gui0D, ctermfg = colours.cterm0D })
vim.api.nvim_set_hl(0, 'gitcommitDiscardedType', { fg = colours.gui0D, ctermfg = colours.cterm0D })
vim.api.nvim_set_hl(0, 'gitcommitBranch', { fg = colours.gui09, ctermfg = colours.cterm09, bold = true })
vim.api.nvim_set_hl(0, 'gitcommitUntrackedFile', { fg = colours.gui0A, ctermfg = colours.cterm0A })
vim.api.nvim_set_hl(0, 'gitcommitUnmergedFile', { fg = colours.gui08, ctermfg = colours.cterm08, bold = true })
vim.api.nvim_set_hl(0, 'gitcommitDiscardedFile', { fg = colours.gui08, ctermfg = colours.cterm08, bold = true })
vim.api.nvim_set_hl(0, 'gitcommitSelectedFile', { fg = colours.gui0B, ctermfg = colours.cterm0B, bold = true })

-- HTML highlighting
vim.api.nvim_set_hl(0, 'htmlBold', { fg = colours.gui0A, ctermfg = colours.cterm0A })
vim.api.nvim_set_hl(0, 'htmlItalic', { fg = colours.gui0E, ctermfg = colours.cterm0E })
vim.api.nvim_set_hl(0, 'htmlEndTag', { fg = colours.gui05, ctermfg = colours.cterm05 })
vim.api.nvim_set_hl(0, 'htmlTag', { fg = colours.gui05, ctermfg = colours.cterm05 })

-- JavaScript highlighting
vim.api.nvim_set_hl(0, 'javaScript', { fg = colours.gui05, ctermfg = colours.cterm05 })
vim.api.nvim_set_hl(0, 'javaScriptBraces', { fg = colours.gui05, ctermfg = colours.cterm05 })
vim.api.nvim_set_hl(0, 'javaScriptNumber', { fg = colours.gui09, ctermfg = colours.cterm09 })

-- LSP highlighting
vim.api.nvim_set_hl(0, 'LspDiagnosticsDefaultError', { fg = colours.gui08, ctermfg = colours.cterm08 })
vim.api.nvim_set_hl(0, 'LspDiagnosticsDefaultWarning', { fg = colours.gui09, ctermfg = colours.cterm09 })
vim.api.nvim_set_hl(0, 'LspDiagnosticsDefaultHnformation', { fg = colours.gui05, ctermfg = colours.cterm05 })
vim.api.nvim_set_hl(0, 'LspDiagnosticsDefaultHint', { fg = colours.gui03, ctermfg = colours.cterm03 })

-- Markdown highlighting
vim.api.nvim_set_hl(0, 'markdownCode', { fg = colours.gui0B, ctermfg = colours.cterm0B })
vim.api.nvim_set_hl(0, 'markdownError', { fg = colours.gui05, bg = colours.gui00, ctermfg = colours.cterm05, ctermbg = colours.cterm00 })
vim.api.nvim_set_hl(0, 'markdownCodeBlock', { fg = colours.gui0B, ctermfg = colours.cterm0B })
vim.api.nvim_set_hl(0, 'markdownHeadingDelimiter', { fg = colours.gui0D, ctermfg = colours.cterm0D })

-- PHP highlighting
vim.api.nvim_set_hl(0, 'phpMemberSelector', { fg = colours.gui05, ctermfg = colours.cterm05 })
vim.api.nvim_set_hl(0, 'phpComparison', { fg = colours.gui05, ctermfg = colours.cterm05 })
vim.api.nvim_set_hl(0, 'phpParent', { fg = colours.gui05, ctermfg = colours.cterm05 })
vim.api.nvim_set_hl(0, 'phpMethodsVar', { fg = colours.gui0C, ctermfg = colours.cterm0C })

-- Python highlighting
vim.api.nvim_set_hl(0, 'pythonOperator', { fg = colours.gui0E, ctermfg = colours.cterm0E })
vim.api.nvim_set_hl(0, 'pythonRepeat', { fg = colours.gui0E, ctermfg = colours.cterm0E })
vim.api.nvim_set_hl(0, 'pythonInclude', { fg = colours.gui0E, ctermfg = colours.cterm0E })
vim.api.nvim_set_hl(0, 'pythonStatement', { fg = colours.gui0E, ctermfg = colours.cterm0E })

-- Ruby highlighting
vim.api.nvim_set_hl(0, 'rubyAttribute', { fg = colours.gui0D, ctermfg = colours.cterm0D })
vim.api.nvim_set_hl(0, 'rubyConstant', { fg = colours.gui0A, ctermfg = colours.cterm0A })
vim.api.nvim_set_hl(0, 'rubyInterpolationDelimiter', { fg = colours.gui0F, ctermfg = colours.cterm0F })
vim.api.nvim_set_hl(0, 'rubyRegexp', { fg = colours.gui0C, ctermfg = colours.cterm0C })
vim.api.nvim_set_hl(0, 'rubySymbol', { fg = colours.gui0B, ctermfg = colours.cterm0B })
vim.api.nvim_set_hl(0, 'rubyStringDelimiter', { fg = colours.gui0B, ctermfg = colours.cterm0B })

-- SASS highlighting
vim.api.nvim_set_hl(0, 'sassidChar', { fg = colours.gui08, ctermfg = colours.cterm08 })
vim.api.nvim_set_hl(0, 'sassClassChar', { fg = colours.gui09, ctermfg = colours.cterm09 })
vim.api.nvim_set_hl(0, 'sassInclude', { fg = colours.gui0E, ctermfg = colours.cterm0E })
vim.api.nvim_set_hl(0, 'sassMixing', { fg = colours.gui0E, ctermfg = colours.cterm0E })
vim.api.nvim_set_hl(0, 'sassMixinName', { fg = colours.gui0D, ctermfg = colours.cterm0D })

-- Spelling highlighting
vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true })
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true })
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true })
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true })

-- vim: filetype=lua
