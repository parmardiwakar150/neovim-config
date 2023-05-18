vim.g.mapleader = ' '

vim.keymap.set('n', '<C-h>', '<C-w>h>')
vim.keymap.set('n', '<C-j>', '<C-w>j>')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<leader>i>', vim.lsp.buf.format)
vim.keymap.set('n', '<leader><CR>', ':source %<CR>')
-- vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
-- vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv")
