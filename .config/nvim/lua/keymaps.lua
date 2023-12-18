local M = {}

-- [[ Basic Keymaps ]]

-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Clear search highlight
vim.keymap.set({ 'n', 'v' }, '<Esc><Esc>', '<CMD>nohls<CR>', { desc = 'Clear highlights', silent = true })

-- System clipboard bindings
vim.keymap.set({ 'n', 'v' }, '<Leader>p', '"+p', { desc = '[P]aste from system clipboard', silent = true })
vim.keymap.set({ 'n', 'v' }, '<Leader>P', '"+P', { desc = '[P]aste before cursor from system clipboard', silent = true })
vim.keymap.set({ 'n', 'v' }, '<Leader>y', '"+y', { desc = '[Y]ank to system clipboard', silent = true })
vim.keymap.set({ 'n', 'v' }, '<Leader>Y', '"+y$', { desc = '[Y]ank until end of line to system clipboard', silent = true })

-- Change/delete without yanking
vim.keymap.set({ 'n', 'v' }, '<Leader>c', '"_c', { desc = '[C]hange without yanking', silent = true })
vim.keymap.set({ 'n', 'v' }, '<Leader>C', '"_C', { desc = '[C]hange to end of line without yanking', silent = true })
vim.keymap.set({ 'n', 'v' }, '<Leader>d', '"_d', { desc = '[D]elete without yanking', silent = true })
vim.keymap.set({ 'n', 'v' }, '<Leader>D', '"_D', { desc = '[D]elete to end of line without yanking', silent = true })

-- Bigger movements on bigger hjkl (rebind J and K as their defaults are useful)
vim.keymap.set({ 'n' }, '<C-j>', 'J', { desc = '[J]oin lines', silent = true })
vim.keymap.set({ 'n' }, '<C-k>', 'K', { desc = '[K]eyword program', silent = true })
vim.keymap.set({ 'n', 'v' }, 'H', '^', { desc = 'Go to first character (bigger h)', silent = true })
vim.keymap.set({ 'n', 'v' }, 'J', '<C-f>', { desc = 'Page down (bigger j)', silent = true })
vim.keymap.set({ 'n', 'v' }, 'K', '<C-b>', { desc = 'Page up (bigger k)', silent = true })
vim.keymap.set({ 'n', 'v' }, 'L', '$', { desc = 'Go to end (bigger l)', silent = true })

-- Make Y work like D and C
vim.keymap.set({ 'n', 'v' }, 'Y', 'y$', { desc = '[Y]ank until end of line', silent = true })

-- Switch buffers
vim.keymap.set({ 'n' }, '<BS>', '<CMD>b#<CR>', { desc = 'Go back to previous buffer', silent = true })
vim.keymap.set({ 'n' }, ']b', '<CMD>bnext<CR>', { desc = 'Go to next buffer (in list order)', silent = true })
vim.keymap.set({ 'n' }, '[b', '<CMD>bprevious<CR>', { desc = 'Go to previous buffer (in list order)', silent = true })

-- Run jq because I can never remember the exact order of %/!/spaces
vim.keymap.set({ 'n' }, '<Leader>jq', '<CMD>% !jq<CR>', { desc = 'Run [jq] on the current buffer', silent = true })

-- Better redo
vim.keymap.set({ 'n', 'v' }, 'U', '<C-r>', { desc = 'Redo', silent = true })

-- Window navigation, I find C-w harder to use than I want for a quick switch
vim.keymap.set({ 'n', 'v' }, '<Leader>h', '<C-w>h', { desc = 'Switch windows left', silent = true })
vim.keymap.set({ 'n', 'v' }, '<Leader>j', '<C-w>j', { desc = 'Switch windows down', silent = true })
vim.keymap.set({ 'n', 'v' }, '<Leader>k', '<C-w>k', { desc = 'Switch windows up', silent = true })
vim.keymap.set({ 'n', 'v' }, '<Leader>l', '<C-w>l', { desc = 'Switch windows right', silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<Leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<Leader>b', require('telescope.builtin').buffers, { desc = 'Find existing [B]uffers' })
vim.keymap.set('n', '<Leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<Leader>f', function()
  -- Use fd instead of the default as it picks up my ~/.config/fd/ignore (ignores .git/)
  require('telescope.builtin').find_files({ find_command = { 'fd' }, hidden = true })
end, { desc = 'Search [F]iles' })

vim.keymap.set('n', '<Leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<Leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<Leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<Leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })

function M.lsp_on_attach(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<Leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<Leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<Leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')

  -- See `:help K` for why this keymap
  nmap('<C-k>', vim.lsp.buf.hover, 'Hover Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<Leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<Leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  nmap('<Leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<Leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<Leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

return M
