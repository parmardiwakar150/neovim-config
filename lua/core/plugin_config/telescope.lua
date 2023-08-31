local builtin = require("telescope.builtin")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local conf = require("telescope.config").values
local lga_actions = require("telescope-live-grep-args.actions")
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

local utils = require("core.utils")

-- Custom Telescope pickers
local modified_buffers = function(f_opts)
	f_opts = f_opts or {}
	pickers
		.new(f_opts, {
			prompt_title = "Modified Buffers",
			finder = finders.new_table({
				results = utils.list_modified_buffers(),
			}),
			sorter = conf.file_sorter(f_opts),
			previewer = conf.file_previewer(f_opts),
		})
		:find()
end

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
vim.keymap.set("n", "<leader>fg", builtin.grep_string, opts)
vim.keymap.set(
	"n",
	"<C-b>",
	":lua require('telescope.builtin').buffers({ sort_mru = true, ignore_current_buffer = true })<CR>",
	opts
)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
-- vim.keymap.set("n", "<leader>h", builtin.oldfiles, opts)
vim.keymap.set("n", "<leader>ch", builtin.command_history, opts)
vim.keymap.set("n", "<leader>/", builtin.lsp_document_symbols, opts)
vim.keymap.set("n", "<C-p>", builtin.git_files, opts)
vim.keymap.set("n", "<leader>gs", builtin.git_status, opts)
vim.keymap.set("n", "<leader>ss", ":Telescope session-lens search_session theme=ivy<CR>", opts)
-- vim.keymap.set("n", "<leader>l", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>l", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", opts)
vim.keymap.set("n", "<leader>gw", live_grep_args_shortcuts.grep_word_under_cursor)
vim.keymap.set("v", "<leader>l", live_grep_args_shortcuts.grep_visual_selection)
vim.keymap.set("n", "<leader>fb", builtin.current_buffer_fuzzy_find, opts)
vim.keymap.set("n", "<leader>fm", modified_buffers, opts)
vim.keymap.set("n", "<leader>m", function()
	builtin.man_pages({ sections = { "ALL" } })
end, opts)
vim.keymap.set("n", "<leader>cm", function()
	builtin.man_pages({ default_text = vim.fn.expand("<cword>"), sections = { "ALL" } })
end, opts)

require("telescope").setup({
	defaults = {
		prompt_prefix = " ",
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<c-d>"] = actions.delete_buffer,
				["<c-q>"] = function(bufnr)
					actions.smart_send_to_qflist(bufnr)
					vim.cmd("Trouble quickfix")
				end,
			},
		},
		sorting_strategy = "ascending",
		layout_strategy = "bottom_pane",
		layout_config = {
			height = 25,
		},
		border = true,
		borderchars = {
			prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
			results = { " " },
			preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		},
	},
	pickers = {
		colorscheme = {
			enable_preview = true,
		},
	},
	extensions = {
		command_palette = {
			{
				"File",
				{ "entire selection (C-a)", ':call feedkeys("GVgg")' },
				{ "save current file (C-s)", ":w" },
				{ "save all files (C-A-s)", ":wa" },
				{ "quit (C-q)", ":qa" },
				{ "file browser (C-i)", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
				{ "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },
				{ "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },
				{ "files (C-f)", ":lua require('telescope.builtin').find_files()", 1 },
			},
			{
				"Help",
				{ "tips", ":help tips" },
				{ "cheatsheet", ":help index" },
				{ "tutorial", ":help tutor" },
				{ "summary", ":help summary" },
				{ "quick reference", ":help quickref" },
				{ "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
			},
			{
				"Vim",
				{ "reload vimrc", ":source $MYVIMRC" },
				{ "check health", ":checkhealth" },
				{ "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
				{ "commands", ":lua require('telescope.builtin').commands()" },
				{ "command history", ":lua require('telescope.builtin').command_history()" },
				{ "registers (A-e)", ":lua require('telescope.builtin').registers()" },
				{ "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
				{ "vim options", ":lua require('telescope.builtin').vim_options()" },
				{ "keymaps", ":lua require('telescope.builtin').keymaps()" },
				{ "buffers", ":Telescope buffers" },
				{ "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
				{ "paste mode", ":set paste!" },
				{ "cursor line", ":set cursorline!" },
				{ "cursor column", ":set cursorcolumn!" },
				{ "spell checker", ":set spell!" },
				{ "relative number", ":set relativenumber!" },
				{ "search highlighting (F12)", ":set hlsearch!" },
			},
		},
		live_grep_args = {
			auto_quoting = true,
			mappings = {
				i = {
					["<C-i>"] = lga_actions.quote_prompt({ postfix = " -t" }),
				},
			},
		},
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

require("telescope").load_extension("command_palette")
require("telescope").load_extension("session-lens")
require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("fzf")
require("telescope").load_extension("harpoon")
