local dap = require("dap")
dap.adapters.lldb = {
  type = 'executable',
  command = 'codelldb',
  name = 'lldb'
}

dap.configurations.c = {
  {
    name = "Launch (lldb)",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    console = "integratedTerminal",
  },
}


dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c
