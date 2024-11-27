-- debug.lua

return {
  -- Enable debugging
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',

    -- UI dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',
  },
  cmd = { 'DapToggleBreakpoint', 'DapContinue' },
  config = function()
    local dap, dapui = require('dap'), require('dapui')
    dapui.setup()

    -- Set dapui to run when dap runs
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    dap.adapters.coreclr = {
      type = 'executable',
      --[[
        Weird stuff going on with this command -
        Using what would be the normal way of doing it (vim.fn.exepath('netcoredbg')) gets some .cmd file that just
        doesn't seem to work right. Instead we have to use vim.fs.find to search the std data path. However,
        that returns a table (hence the [1]), and we pass it to vim.fs.normalize to get the slashes right.
      ]]
      command = vim.fs.normalize((vim.fs.find('netcoredbg.exe', { path = vim.fn.stdpath('data') }))[1]),
      args = {'--interpreter=vscode'},
    }

    dap.configurations.cs = {
      {
        type = 'coreclr',
        name = 'attach - netcoredbg',
        request = 'attach',
        program = function()
          return vim.fn.input('Path to dll', vim.fn.getcwd() .. '\\bin\\Debug\\', 'file')
        end,
      },
      {
        type = 'coreclr',
        name = 'launch - netcoredbg',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to dll', vim.fn.getcwd() .. '\\bin\\Debug\\', 'file')
        end,
      },
    }
  end,
}
