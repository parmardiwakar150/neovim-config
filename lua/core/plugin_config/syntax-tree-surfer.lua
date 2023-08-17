local sytanx_tree_surfer = require("syntax-tree-surfer")
sytanx_tree_surfer.setup({})
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "vd", "<cmd>STSSwapCurrentNodeNextNormal<cr>", opts)
vim.keymap.set("n", "vu", "<cmd>STSSwapCurrentNodePrevNormal<cr>", opts)
vim.keymap.set("n", "vD", "<cmd>STSSwapDownNormal<cr>", opts)
vim.keymap.set("n", "vU", "<cmd>STSSwapUpNormal<cr>", opts)
vim.keymap.set("n", "[t", function()
	sytanx_tree_surfer.go_to_top_node_and_execute_commands(false, { "normal! w" })
end, opts)
vim.keymap.set("n", "]t", function()
	sytanx_tree_surfer.go_to_top_node_and_execute_commands(true, {})
end, opts)
