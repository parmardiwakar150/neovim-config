require("harpoon").setup({})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>hh", ":Telescope harpoon marks<CR>", opts)
vim.keymap.set("n", "<leader>ha", ':lua require("harpoon.mark").add_file()<CR>', opts)
vim.keymap.set("n", "<leader>hr", ':lua require("harpoon.mark").rm_file()<CR>', opts)
