vim.o.termguicolors = true
require("onedark").setup({
	-- Main options --
	style = "cool", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	transparent = true, -- Show/hide background
	term_colors = true, -- Change terminal color as per the selected theme style
	ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

	-- toggle theme style ---
	toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
	toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

	-- Change code style ---
	-- Options are italic, bold, underline, none
	-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
	code_style = {
		comments = "italic",
		keywords = "none",
		functions = "none",
		strings = "none",
		variables = "none",
	},

	-- Lualine options --
	lualine = {
		transparent = true, -- lualine center bar transparency
	},

	-- Custom Highlights --
	colors = {
		-- blue = "#FFD580",
		-- -- cyan = '#FFD580',
		-- purple = "#FFA759",
	}, -- Override default colors
	highlights = {
		FloatBorder = { fg = "#61AFEE", bg = "none" },
		-- ["@keyword"] = { fg = '$green' },
		-- ["@keyword.function"] = { fg = '$green' },
		-- ["@keyword.operator"] = { fg = '$green' },
		["@constructor"] = { fmt = "none" },
	}, -- Override highlight groups

	-- Plugins Config --
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = true, -- use background color for virtual text
	},
})
vim.cmd([[ colorscheme onedark ]])
-- vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#343e4f' })

require("gruvbox").setup({
	undercurl = false,
	underline = false,
	bold = false,
	italic = {
		strings = false,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = false,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "hard", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {
		String = { fg = "#689d6a" },
	},
	dim_inactive = false,
	transparent_mode = true,
})
-- vim.cmd("colorscheme gruvbox")

require("ayu").setup({
	mirage = true, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
	overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
})

local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "x", "o" }, "<leader>tg", ":colorscheme gruvbox<CR>", opts)
vim.keymap.set({ "n", "x", "o" }, "<leader>to", ":colorscheme onedark<CR>", opts)
-- vim.keymap.set({ "n", "x", "o" }, "<leader>ta", ":colorscheme ayu<CR>", opts)

-- require("one").colorscheme()
