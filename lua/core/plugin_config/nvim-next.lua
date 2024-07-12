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
local lspsaga_diagnostic = require("lspsaga.diagnostic")

local next_hunk_repeat, prev_hunk_repeat = next.make_repeatable_pair(gs.next_hunk, gs.prev_hunk)
local next_diagnostic_repeat, prev_diagnostic_repeat = next.make_repeatable_pair(function()
	lspsaga_diagnostic:goto_next()
end, function()
	lspsaga_diagnostic:goto_prev()
end)

vim.keymap.set({ "n", "x", "o" }, "]h", next_hunk_repeat)
vim.keymap.set({ "n", "x", "o" }, "[h", prev_hunk_repeat)

vim.keymap.set({ "n", "x", "o" }, "]e", next_diagnostic_repeat)
vim.keymap.set({ "n", "x", "o" }, "[e", prev_diagnostic_repeat)
