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
