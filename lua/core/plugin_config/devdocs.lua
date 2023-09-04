local utils = require("core.utils")
require("nvim-devdocs").setup({
	dir_path = vim.fn.stdpath("data") .. "/devdocs",
	telescope = {},
	float_win = {
		relative = "editor",
		height = utils.get_float_win_height(),
		width = utils.get_float_win_width(),
		border = "rounded",
	},
	wrap = true,
	ensure_installed = {},
	previewer_cmd = "glow",
	cmd_args = { "-s", "dracula", "-w", utils.get_float_win_width() },
	mappings = {
		open_in_browser = "gx",
	},
	after_open = function(bufnr)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<Esc>", ":close<CR>", { silent = true })
		vim.api.nvim_buf_set_keymap(bufnr, "n", "q", ":close<CR>", { silent = true })
	end,
})
