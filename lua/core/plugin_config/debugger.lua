local dap, dapui = require("dap"), require("dapui")

require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
vim.keymap.set("n", "<leader>dd", ":DapContinue<CR>")
-- vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
