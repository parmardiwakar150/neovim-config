vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

local group = vim.api.nvim_create_augroup("Stylua", {})
vim.api.nvim_create_autocmd("bufWritePost", {
	pattern = "*.lua",
	callback = function()
		vim.cmd("silent :! stylua %")
	end,
	group = group,
})

local format_on_save_group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
vim.api.nvim_create_autocmd("bufWritePost", {
	pattern = { "*.c", "*.cpp" },
	callback = function()
		vim.lsp.buf.format()
	end,
	group = format_on_save_group,
})
