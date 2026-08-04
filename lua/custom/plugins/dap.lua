return {
  'mfussenegger/nvim-dap',
  opts = {},
  event = 'VeryLazy',
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      automatic_installation = true,
      handlers = {},
      ensure_installed = { 'codelldb', 'delve' },
    }

    dapui.setup {}
    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    vim.keymap.set('n', '<Leader>dc', function()
      dap.continue()
    end, { desc = '[D]ebug [C]ontinue' })
    vim.keymap.set('n', '<Leader>do', function()
      require('dap').step_over()
    end, { desc = '[S]tep [O]ver' })
    vim.keymap.set('n', '<Leader>di', function()
      require('dap').step_into()
    end, { desc = '[S]tep [I]nto' })
    vim.keymap.set('n', '<Leader>du', function()
      require('dap').step_out()
    end, { desc = '[S]tep [O]ut' })
    vim.keymap.set('n', '<Leader>b', function()
      require('dap').toggle_breakpoint()
    end, { desc = 'Toggle [B]reakpoint' })
    vim.keymap.set('n', '<Leader>B', function()
      require('dap').set_breakpoint()
    end, { desc = 'Set [B]reakpoint' })
    vim.keymap.set('n', '<Leader>dlp', function()
      require('dap').set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
    end, { desc = '[D]ebug [L]og [P]oint' })
    vim.keymap.set('n', '<Leader>dro', function()
      require('dap').repl.open()
    end, { desc = '[D]ebug [R]EPL [O]pen' })
    vim.keymap.set('n', '<Leader>drl', function()
      require('dap').run_last()
    end, { desc = '[D]ebug [R]un [L]ast' })
    vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
      require('dap.ui.widgets').hover()
    end, { desc = '[D]ebug [H]over' })
    vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
      require('dap.ui.widgets').preview()
    end, { desc = '[D]ebug [P]review' })
    vim.keymap.set('n', '<Leader>df', function()
      local widgets = require 'dap.ui.widgets'
      widgets.centered_float(widgets.frames)
    end, { desc = '[D]ebug [C]entered [F]loat [F]rames' })
    vim.keymap.set('n', '<Leader>dw', function()
      local widgets = require 'dap.ui.widgets'
      widgets.centered_float(widgets.scopes)
    end, { desc = '[D]ebug [C]entered [F]loat [W]idgets' })

    dap.adapters.go = {
      type = 'server',
      port = '${port}',
      executable = {
        command = 'dlv',
        args = { 'dap', '--listen', '127.0.0.1:${port}' },
      },
    }

    dap.configurations.go = {
      {
        name = 'Launch Package',
        type = 'go',
        request = 'launch',
        program = '${fileDirname}',
      },
    }

    dap.adapters.codelldb = {
      type = 'server',
      port = '${port}',
      executable = {
        command = 'codelldb',
        args = { '--port', '${port}' },
      },
    }

    local c_cpp_configuration = {
      name = 'Launch executable',
      type = 'codelldb',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
    }

    dap.configurations.c = { c_cpp_configuration }
    dap.configurations.cpp = { c_cpp_configuration }
    dap.configurations.make = { c_cpp_configuration }
  end,
}
