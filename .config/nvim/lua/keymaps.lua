-- [[ Basic Keymaps ]]

-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Clear search highlight
vim.keymap.set({ 'n' }, '<Esc>', '<CMD>nohls<CR>', { desc = 'Clear highlights', silent = true })

-- Exit Insert mode easier
vim.keymap.set({ 'i', 'v' }, 'jk', '<Esc>', { desc = 'Quit Insert mode without reaching' })

-- Exit Terminal mode easier
vim.keymap.set({ 't' }, 'jk', '<C-\\><C-n>', { desc = 'Quit Terminal mode without reaching' })

-- Quicker save/exit
vim.keymap.set({ 'n', 'v' }, ';w', '<CMD>w<CR>', { desc = 'Write file' })
vim.keymap.set({ 'n', 'v' }, ';q', '<CMD>q<CR>', { desc = 'Quit file' })
vim.keymap.set({ 'n', 'v' }, ';qa', '<CMD>qa<CR>', { desc = 'Quit all files' })
vim.keymap.set({ 'n', 'v' }, ';qf', '<CMD>q!<CR>', { desc = 'Quit file (force)' })
vim.keymap.set({ 'n', 'v' }, ';qaf', '<CMD>qa!<CR>', { desc = 'Quit all files (force)' })
vim.keymap.set({ 'n', 'v' }, ';x', '<CMD>x<CR>', { desc = 'Save and quit file' })

-- nvim-spider: move by subword by default
vim.keymap.set( { 'n', 'o', 'x' }, 'w', '<cmd>lua require("spider").motion("w")<CR>', { desc = 'Spider-w' })
vim.keymap.set( { 'n', 'o', 'x' }, 'e', '<cmd>lua require("spider").motion("e")<CR>', { desc = 'Spider-e' })
vim.keymap.set( { 'n', 'o', 'x' }, 'b', '<cmd>lua require("spider").motion("b")<CR>', { desc = 'Spider-b' })

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

vim.keymap.set({ 'n', 'v' }, 'S', 'H', { desc = 'Move cursor to [S]creen top', silent = true })
vim.keymap.set({ 'n', 'v' }, 's', 'L', { desc = 'Move cursor to [s]creen bottom', silent = true })

-- Bigger movements on bigger hjkl (rebind J and K as their defaults are useful)
vim.keymap.set({ 'n' }, '<C-j>', 'J', { desc = '[J]oin lines', silent = true })
vim.keymap.set({ 'n' }, '<C-k>', 'K', { desc = '[K]eyword program', silent = true })
vim.keymap.set({ 'n', 'v' }, 'H', '^', { desc = 'Go to first character (bigger h)', silent = true })
vim.keymap.set({ 'n' }, 'J', '<C-f>', { desc = 'Page down (bigger j)', silent = true })
vim.keymap.set({ 'n' }, 'K', '<C-b>', { desc = 'Page up (bigger k)', silent = true })
vim.keymap.set({ 'n', 'v' }, 'L', '$', { desc = 'Go to end (bigger l)', silent = true })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

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

-- Easily edit macros (saved to "q)
-- Stolen from Hillel Wayne: https://buttondown.email/hillelwayne/archive/keep-perfecting-your-config/
vim.keymap.set('n', '<leader>Q', ':let @q = input("Edit macro:", @q)<CR>', { desc = 'Edit a macro saved to "q' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Enable APZelos/blamer.nvim
vim.keymap.set({ 'n', 'v' }, '<Leader>gb', '<CMD>BlamerToggle<CR>', { desc = 'Show inline [g]it [b]lame', silent = true })

-- use Oil.nvim
vim.keymap.set({ 'n' }, '-', '<CMD>Oil --float<CR>', { desc = 'Open parent directory', silent = true })

-- Use Dadbod
vim.keymap.set({ 'n' }, '<Leader>td', '<CMD>DBUIToggle<CR>', { desc = 'Toggle Dadbod UI' })
vim.keymap.set({ 'v' }, '<Leader>x', '<Plug>(DBUI_ExecuteQuery)', { desc = 'Execute selected query' })

-- Not a normal keymap, but set a prefix for chaoren/vim-wordmotion
vim.g.wordmotion_prefix = '\\'

-- See `:help telescope.builtin`
vim.keymap.set('n', '<Leader>f', '<CMD>Telescope find_files<CR>', { desc = 'Search [F]iles' })
vim.keymap.set('n', '<Leader>b', '<CMD>Telescope buffers<CR>', { desc = 'Find existing [B]uffers' })
vim.keymap.set('n', '<Leader>?', '<CMD>Telescope oldfiles<CR>', { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<Leader>/', '<CMD>Telescope current_buffer_fuzzy_find<CR>', { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<Leader>sh', '<CMD>Telescope help_tags<CR>', { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<Leader>sw', '<CMD>Telescope grep_string<CR>', { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<Leader>sg', '<CMD>Telescope live_grep<CR>', { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<Leader>sd', '<CMD>Telescope diagnostics<CR>', { desc = '[S]earch [D]iagnostics' })

-- Diagnostic keymaps
vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })

-- Debugger keymaps
vim.keymap.set('n', '<F5>', '<CMD>DapContinue<CR>', { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F1>', '<CMD>DapStepInto<CR>', { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F2>', '<CMD>DapStepOver<CR>', { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F3>', '<CMD>DapStepOut<CR>', { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<F9>', '<CMD>DapToggleBreakpoint<CR>', { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<F10>', function()
  require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Debug: Set Breakpoint' })
-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
vim.keymap.set('n', '<F7>', '<CMD>lua require("dapui").toggle<CR>', { desc = 'Debug: See last session result.' })


-- LSP Keymaps
-- Load these only when the LSP is active
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
    end

    nmap('<Leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<Leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', function()
      if vim.o.filetype == 'cs' then
        require('omnisharp_extended').telescope_lsp_definitions()
      else
        vim.lsp.buf.definition()
      end
    end, '[G]oto [D]efinition')
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
    vim.api.nvim_buf_create_user_command(event.buf, 'Format', function(_)
      vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
  end
})
