local function change_nvim_tree_dir()
	local nvim_tree = require("nvim-tree")
	nvim_tree.change_dir(vim.fn.getcwd())
end

require("auto-session").setup({
	log_level = "error",
	auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
	post_restore_cmds = { change_nvim_tree_dir },
	pre_save_cmds = { "NvimTreeClose" },
	session_lens = {
		picker = "telescope",
		picker_opts = {
			layout_strategy = "bottom_pane",
			layout_config = {
				height = 25,
			},
			borderchars = {
				prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
				results = { " " },
				preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			},
		},
	},
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ss", ":AutoSession search <CR>", opts)
