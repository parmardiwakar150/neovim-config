local utils = require("core.utils")
local source_current_file = function()
	if vim.bo.filetype == "lua" then
		vim.cmd(":source %")
	end
end
vim.g.mapleader = " "

vim.keymap.set("n", "<C-h>", "<C-w>h>")
vim.keymap.set("n", "<C-j>", "<C-w>j>")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-f>", vim.lsp.buf.format)
vim.keymap.set("n", "<leader><CR>", source_current_file)
vim.keymap.set("n", "<leader>rh", ":Gitsigns reset_hunk<CR>")
vim.keymap.set("n", "<leader>ph", ":Gitsigns preview_hunk<CR>")
vim.keymap.set("v", "<leader>b", utils.format_visual_selection_with_black_formatter)
-- vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
-- vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv")
