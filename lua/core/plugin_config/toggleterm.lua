local utils = require("core.utils")
require("toggleterm").setup({
	open_mapping = [[<c-\>]],
	direction = "horizontal",
	size = 20,
	on_open = function()
		require("lualine").hide()
	end,
	on_close = function()
		require("lualine").hide({ unhide = true })
	end,
	float_opts = {
		-- The border key is *almost* the same as 'nvim_open_win'
		-- see :h nvim_open_win for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		border = "curved",
		-- like `size`, width and height can be a number or function which is passed the current terminal
		-- width = 125,
		-- height = 30,
		width = utils.get_float_win_width,
		height = utils.get_float_win_height,
		winblend = 0,
		zindex = 1000,
	},
})

vim.keymap.set("n", "<leader>1", ":ToggleTerm 1<CR>", {})
vim.keymap.set("n", "<leader>2", ":ToggleTerm 2<CR>", {})
vim.keymap.set("n", "<leader>3", ":ToggleTerm 3<CR>", {})
vim.keymap.set("n", "<leader>4", ":ToggleTerm 4<CR>", {})
vim.keymap.set("n", "<leader>5", ":ToggleTerm 5<CR>", {})
vim.keymap.set("n", "<leader>6", ":ToggleTerm 6<CR>", {})
vim.keymap.set("n", "<leader>7", ":ToggleTerm 7<CR>", {})
vim.keymap.set("n", "<leader>8", ":ToggleTerm 8<CR>", {})
vim.keymap.set("n", "<leader>9", ":ToggleTerm 9<CR>", {})
