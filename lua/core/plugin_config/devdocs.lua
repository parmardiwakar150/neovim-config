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
		width = math.floor(vim.o.columns * 0.7),
		border = "rounded",
	},
	wrap = true,
	ensure_installed = {},
	previewer_cmd = "glow",
	cmd_args = { "-s", "dracula" },
	mappings = {
		open_in_browser = "gx",
	},
	after_open = function(bufnr)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<Esc>", ":close<CR>", { silent = true })
		vim.api.nvim_buf_set_keymap(bufnr, "n", "q", ":close<CR>", { silent = true })
	end,
})
