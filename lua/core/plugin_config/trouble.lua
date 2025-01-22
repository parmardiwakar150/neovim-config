local opts = { silent = true, noremap = true }
-- vim.keymap.set("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle <cr>", opts)
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle <cr>", opts)
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix toggle <cr>", opts)
vim.keymap.set("n", "gr", "<cmd>Trouble lsp_references <cr>", opts)
