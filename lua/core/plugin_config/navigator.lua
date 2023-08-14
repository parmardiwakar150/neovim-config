require("Navigator").setup({
	auto_save = nil,
	disable_on_zoom = false,
	mux = "auto",
})
vim.keymap.set("n", "<C-h>", "<CMD>NavigatorLeft<CR>")
vim.keymap.set("n", "<C-l>", "<CMD>NavigatorRight<CR>")
vim.keymap.set("n", "<C-k>", "<CMD>NavigatorUp<CR>")
vim.keymap.set("n", "<C-j>", "<CMD>NavigatorDown<CR>")
-- vim.keymap.set({'n', 't'}, '<A-p>', '<CMD>NavigatorPrevious<CR>')
