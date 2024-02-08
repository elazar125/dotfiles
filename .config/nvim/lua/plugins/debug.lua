-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
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
  end,
}
