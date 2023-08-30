require("toggleterm").setup({
	open_mapping = [[<c-\>]],
	direction = "float",
	float_opts = {
		-- The border key is *almost* the same as 'nvim_open_win'
		-- see :h nvim_open_win for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		border = "curved",
		-- like `size`, width and height can be a number or function which is passed the current terminal
		-- width = 125,
		-- height = 30,
		width = function()
			local width_ratio = 0.6
			local columns = vim.o.columns
			if columns < 130 then
				width_ratio = 0.9
			elseif columns > 150 and columns < 200 then
				width_ratio = 0.75
			end
			return math.floor(vim.o.columns * width_ratio)
		end,
		height = function()
			local height_ratio = 0.7
			local lines = vim.o.lines
			if lines < 40 then
				height_ratio = 0.9
			end
			return math.floor(vim.o.lines * height_ratio)
		end,
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
