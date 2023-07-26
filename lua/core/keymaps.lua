local utils = require("core.utils")
local source_current_file = function()
	if vim.bo.filetype == "lua" then
		vim.cmd(":source %")
	end
end
vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-h>", "<C-w>h>", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j>", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<C-f>", vim.lsp.buf.format, opts)
vim.keymap.set("n", "<leader><CR>", source_current_file, opts)
vim.keymap.set("n", "<leader>rh", ":Gitsigns reset_hunk<CR>", opts)
vim.keymap.set("n", "<leader>ph", ":Gitsigns preview_hunk<CR>", opts)
vim.keymap.set("n", "<leader>ta", ":ToggleAlternate<CR>", opts)
vim.keymap.set("v", "<leader>b", utils.format_visual_selection_with_black_formatter, opts)
-- Yank into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', opts) -- yank motion
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y', opts) -- yank line

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p', opts) -- paste after cursor
vim.keymap.set("n", "<leader>P", '"+P', opts) -- paste before cursor
-- vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
-- vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv")
