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
		FloatBorder = { fg = "#2d3343", bg = "#2d3343" },
		NormalFloat = { bg = "#2d3343" },
		-- ["@keyword"] = { fg = '$green' },
		-- ["@keyword.function"] = { fg = '$green' },
		-- ["@keyword.operator"] = { fg = '$green' },
		["@constructor"] = { fmt = "none" },
		["@text.uri"] = { fmt = "none" },
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

require("kanagawa").setup({
	compile = false, -- enable compiling the colorscheme
	undercurl = false, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = false },
	statementStyle = { bold = false },
	typeStyle = {},
	transparent = false, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	colors = { -- add/modify theme and palette colors
		palette = {},
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
	},
	overrides = function(colors)
		local theme = colors.theme
		return {
			NormalFloat = { bg = "none" },
			FloatBorder = { bg = "none" },
			FloatTitle = { bg = "none" },

			Boolean = { bold = false },
			["@text.uri"] = { underline = false },

			-- Save an hlgroup with dark background and dimmed foreground
			-- so that you can use it where your still want darker windows.
			-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
			NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

			-- Popular plugins that open floats will link to NormalFloat by default;
			-- set their background accordingly if you wish to keep them dark and borderless
			-- LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
			MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

			-- Telescope
			-- TelescopeTitle = { fg = theme.ui.special, bold = true },
			-- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
			-- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
			-- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
			-- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
			-- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
			-- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

			-- Completion menu
			Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
			PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
			PmenuSbar = { bg = theme.ui.bg_m1 },
			PmenuThumb = { bg = theme.ui.bg_p2 },
		}
	end,
	theme = "wave", -- Load "wave" theme when 'background' option is not set
	background = { -- map the value of 'background' option to a theme
		dark = "wave", -- try "dragon" !
		light = "lotus",
	},
})

-- setup must be called before loading
-- vim.cmd("colorscheme kanagawa")

local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "x", "o" }, "<leader>tg", ":colorscheme gruvbox<CR>", opts)
vim.keymap.set({ "n", "x", "o" }, "<leader>to", ":colorscheme onedark<CR>", opts)
-- vim.keymap.set({ "n", "x", "o" }, "<leader>ta", ":colorscheme ayu<CR>", opts)

-- require("one").colorscheme()
