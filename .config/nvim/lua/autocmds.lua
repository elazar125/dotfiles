--[[

Set up autocommands here

These are functions that run on various events, allowing
tons of customization for things smaller than a plugin

--]]

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
  pattern = '*',
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
  command = [[%s/\s\+$//e]],
  pattern = '*',
})

vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
  command = 'set spelloptions=camel',
})
