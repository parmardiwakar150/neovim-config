require("nvim-devdocs").setup({
	dir_path = vim.fn.stdpath("data") .. "/devdocs",
	telescope = {},
	telescope_alt = {
		layout_config = {
			width = 75,
		},
	},
	float_win = {
		relative = "editor",
		height = math.floor(vim.o.lines * 0.7),
		width = math.floor(vim.o.columns * 0.8),
		border = "rounded",
	},
	wrap = true,
	ensure_installed = {},
})
