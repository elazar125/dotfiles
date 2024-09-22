-- debug.lua

return {
  -- Enable debugging
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
  },
  cmd = { 'DapToggleBreakpoint', 'DapContinue' },
  config = function()
    require('dapui').setup()

    -- Set dapui to run when dap runs
    require('dap').listeners.after.event_initialized['require("dapui")_config'] = require('dapui').open
    require('dap').listeners.before.event_terminated['require("dapui")_config'] = require('dapui').close
    require('dap').listeners.before.event_exited['require("dapui")_config'] = require('dapui').close

    -- Install golang specific config
    require('dap-go').setup()

    require('dap').adapters.coreclr = {
      type = 'executable',
      command = '~/.config/dependencies/netcoredbg/build/src/Debug/netcoredbg.exe',
      args = {'--interpreter=vscode'}
    }

    require('dap').configurations.cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
          return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end,
      },
    }
  end,
}
