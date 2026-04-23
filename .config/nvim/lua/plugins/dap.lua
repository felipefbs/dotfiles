vim.pack.add({
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/rcarriga/nvim-dap-ui',
  'https://github.com/leoluz/nvim-dap-go',
})

local dap = require('dap')
local dapui = require('dapui')
dapui.setup()

require('dap-go').setup()

-- dap.configurations.go = {
--   {
--     type = 'go',
--     name = 'Debug file',
--     request = 'launch',
--     program = '${file}',
--     console = "externalTerminal",
--   },
--   {
--     type = 'go',
--     name = 'Debug test file',
--     request = 'launch',
--     mode = 'test',
--     program = '${file}',
--     console = "externalTerminal",
--   },
-- }
--

vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Continue' })
vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Step Over' })
vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Step Into' })
vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Step Out' })
vim.keymap.set('n', '<Leader>zb', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
vim.keymap.set('n', '<Leader>zB', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, { desc = 'Conditional Breakpoint' })
vim.keymap.set('n', '<Leader>zu', dapui.toggle, { desc = 'Toggle UI' })
vim.keymap.set('n', '<Leader>zc', dap.continue, { desc = 'Continue' })
vim.keymap.set('n', '<Leader>zr', dap.repl.toggle, { desc = 'Open REPL' })
vim.keymap.set('n', '<Leader>zl', function()
  dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end, { desc = 'Log point' })

local wk = require('which-key')

wk.add({
  { '<leader>z', group = 'Debug' },
  { '<leader>zc', desc = 'Continue' },
  { '<leader>zb', desc = 'Toggle breakpoint' },
  { '<leader>zB', desc = 'Conditional breakpoint' },
  { '<leader>zl', desc = 'Log point' },
  { '<leader>zu', desc = 'Toggle UI' },
  { '<leader>zr', desc = 'Open REPL' },
})


dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end

dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end
