local nvim_next_builtins = require("nvim-next.builtins")
require("nvim-next").setup({
	default_mappings = {
		repeat_style = "original",
	},
	items = {
		nvim_next_builtins.f,
		nvim_next_builtins.t,
	},
})

local next = require("nvim-next").setup()

local gs = require("gitsigns")

local next_hunk_repeat, prev_hunk_repeat = next.make_repeatable_pair(gs.next_hunk, gs.prev_hunk)

vim.keymap.set({ "n", "x", "o" }, "]h", next_hunk_repeat)
vim.keymap.set({ "n", "x", "o" }, "[h", prev_hunk_repeat)
