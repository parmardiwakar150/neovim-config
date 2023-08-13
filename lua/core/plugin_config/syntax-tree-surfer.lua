require("syntax-tree-surfer").setup({})
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "vd", "<cmd>STSSwapCurrentNodeNextNormal<cr>", opts)
vim.keymap.set("n", "vu", "<cmd>STSSwapCurrentNodePrevNormal<cr>", opts)
vim.keymap.set("n", "vD", "<cmd>STSSwapDownNormal<cr>", opts)
vim.keymap.set("n", "vU", "<cmd>STSSwapUpNormal<cr>", opts)
