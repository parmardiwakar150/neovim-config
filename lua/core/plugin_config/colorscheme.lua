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
		transparent = false, -- lualine center bar transparency
	},

	-- Custom Highlights --
	colors = {
		-- blue = "#FFD580",
		-- -- cyan = '#FFD580',
		-- purple = "#FFA759",
	}, -- Override default colors
	highlights = {
		FloatBorder = { bg = "none" },
		NormalFloat = { bg = "none" },
		TreesitterContext = { bg = "#2d3343" },
		IndentBlankLineContextChar = { fg = "#67b0e8" },
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
-- vim.cmd([[ colorscheme onedark ]])
-- vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#343e4f' })
-- vim.api.nvim_set_hl(0, "SagaBorder", { bg = "none", fg = "#61AFEE" })

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
	transparent = true, -- do not set background color
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
		local palette = colors.palette
		return {
			NormalFloat = { bg = "none" },
			FloatBorder = { bg = "none", fg = palette.dragonYellow },
			FloatTitle = { bg = "none" },

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
			TelescopePromptBorder = { fg = theme.ui.fg_dim, bg = "none" },
			-- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
			TelescopeResultsBorder = { fg = theme.ui.fg_dim, bg = "none" },
			TelescopePreviewNormal = { bg = "none" },
			TelescopePreviewBorder = { bg = "none", fg = theme.ui.fg_dim },

			-- Completion menu
			Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
			PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
			PmenuSbar = { bg = theme.ui.bg_m1 },
			PmenuThumb = { bg = theme.ui.bg_p2 },
			Boolean = { fg = palette.dragonPink, bold = false },
			Constant = { fg = palette.dragonPink },

			Identifier = { fg = palette.dragonBlue },
			Statement = { fg = palette.dragonBlue }, -- logic, focus
			Operator = { fg = palette.dragonGray2 },
			Keyword = { fg = palette.dragonRed }, -- strength of builtin keywords (core)
			-- Function = { fg = palette.dragonGreen }, -- v1. i like green functions
			Function = { fg = palette.dragonOrange }, -- v2. action

			-- Type = { fg = palette.dragonYellow }, -- v1. creativity of custom types
			Type = { fg = palette.dragonGreen }, -- v2. Newness

			-- Special = { fg = palette.dragonOrange }, -- v1. which emphesises the maturity over the new types
			Special = { fg = palette.dragonYellow }, -- v2. cheers, that this type is builtin

			["@lsp.typemod.function.readonly"] = { fg = palette.dragonBlue },
			["@variable.member"] = { fg = palette.dragonBlue },
		}
	end,
	theme = "dragon", -- Load "wave" theme when 'background' option is not set
	background = { -- map the value of 'background' option to a theme
		dark = "dragon", -- try "dragon" !
		light = "lotus",
	},
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")

require("everblush").setup({
	override = {
		TelescopeSelection = { bg = "#2c3333" },
		VertSplit = { bg = "none", fg = "#363c51" },
		NormalFloat = { bg = "#2c3333" },
		FloatBorder = { fg = "#2c3333", bg = "#2c3333" },
		CursorLineNr = { fg = "#a5b0c5" },
		["@exception"] = { fg = "#67b0e8" },
	},
	transparent_background = false,
	nvim_tree = {
		contrast = false,
	},
})
-- vim.cmd("colorscheme everblush")

require("catppuccin").setup({
	background = {
		light = "latte",
		dark = "mocha",
	},
	color_overrides = {
		latte = {
			rosewater = "#c14a4a",
			flamingo = "#c14a4a",
			red = "#c14a4a",
			maroon = "#c14a4a",
			pink = "#945e80",
			mauve = "#945e80",
			peach = "#c35e0a",
			yellow = "#b47109",
			green = "#6c782e",
			teal = "#4c7a5d",
			sky = "#4c7a5d",
			sapphire = "#4c7a5d",
			blue = "#45707a",
			lavender = "#45707a",
			text = "#654735",
			subtext1 = "#73503c",
			subtext0 = "#805942",
			overlay2 = "#8c6249",
			overlay1 = "#8c856d",
			overlay0 = "#a69d81",
			surface2 = "#bfb695",
			surface1 = "#d1c7a3",
			surface0 = "#e3dec3",
			base = "#f9f5d7",
			mantle = "#f0ebce",
			crust = "#e8e3c8",
		},
		mocha = {
			rosewater = "#ea6962",
			flamingo = "#ea6962",
			red = "#ea6962",
			maroon = "#ea6962",
			pink = "#d3869b",
			mauve = "#d3869b",
			peach = "#e78a4e",
			yellow = "#d8a657",
			green = "#a9b665",
			teal = "#89b482",
			sky = "#89b482",
			sapphire = "#89b482",
			blue = "#7daea3",
			lavender = "#7daea3",
			text = "#ebdbb2",
			subtext1 = "#d5c4a1",
			subtext0 = "#bdae93",
			overlay2 = "#a89984",
			overlay1 = "#928374",
			overlay0 = "#595959",
			surface2 = "#4d4d4d",
			surface1 = "#404040",
			surface0 = "#292929",
			base = "#1d2021",
			mantle = "#191b1c",
			crust = "#141617",
		},
	},
	transparent_background = false,
	show_end_of_buffer = false,
	integration_default = false,
	integrations = {
		barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
		cmp = true,
		gitsigns = true,
		hop = true,
		illuminate = { enabled = true },
		native_lsp = { enabled = true, inlay_hints = { background = true } },
		neogit = true,
		neotree = true,
		semantic_tokens = true,
		treesitter = true,
		treesitter_context = true,
		vimwiki = true,
		which_key = true,
	},
	highlight_overrides = {
		all = function(colors)
			return {
				CmpItemMenu = { fg = colors.surface2 },
				CursorLineNr = { fg = colors.text },
				FloatBorder = { bg = colors.base, fg = colors.surface0 },
				GitSignsChange = { fg = colors.peach },
				LineNr = { fg = colors.overlay0 },
				LspInfoBorder = { link = "FloatBorder" },
				TreesitterContext = { bg = colors.surface0 },
				TreesitterContextLineNumber = { fg = colors.subtext1, bg = "none" },
				NeoTreeDirectoryIcon = { fg = colors.subtext1 },
				NeoTreeDirectoryName = { fg = colors.subtext1 },
				NeoTreeFloatBorder = { link = "TelescopeResultsBorder" },
				NeoTreeGitConflict = { fg = colors.red },
				NeoTreeGitDeleted = { fg = colors.red },
				NeoTreeGitIgnored = { fg = colors.overlay0 },
				NeoTreeGitModified = { fg = colors.peach },
				NeoTreeGitStaged = { fg = colors.green },
				NeoTreeGitUnstaged = { fg = colors.red },
				NeoTreeGitUntracked = { fg = colors.green },
				NeoTreeIndent = { fg = colors.surface1 },
				NeoTreeNormal = { bg = colors.mantle },
				NeoTreeNormalNC = { bg = colors.mantle },
				NeoTreeRootName = { fg = colors.subtext1, style = { "bold" } },
				NeoTreeTabActive = { fg = colors.text, bg = colors.mantle },
				NeoTreeTabInactive = { fg = colors.surface2, bg = colors.crust },
				NeoTreeTabSeparatorActive = { fg = colors.mantle, bg = colors.mantle },
				NeoTreeTabSeparatorInactive = { fg = colors.crust, bg = colors.crust },
				NeoTreeWinSeparator = { fg = colors.base, bg = colors.base },
				NormalFloat = { bg = colors.base },
				Pmenu = { bg = colors.mantle, fg = "" },
				PmenuSel = { bg = colors.surface0, fg = "" },
				TelescopePreviewBorder = { bg = "none", fg = colors.subtext2 },
				-- TelescopePreviewNormal = { bg = colors.crust },
				TelescopePreviewTitle = { fg = colors.text, bg = "none" },
				TelescopePromptBorder = { fg = colors.text, bg = "none" },
				-- TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
				-- TelescopePromptCounter = { fg = colors.mauve, style = { "bold" } },
				-- TelescopePromptNormal = { bg = colors.surface0 },
				-- TelescopePromptPrefix = { bg = colors.surface0 },
				TelescopePromptTitle = { fg = colors.text, bg = "none" },
				-- TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
				-- TelescopeResultsNormal = { bg = colors.mantle },
				-- TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
				-- TelescopeSelection = { bg = colors.surface0 },
				VertSplit = { bg = colors.base, fg = colors.surface0 },
				WhichKeyFloat = { bg = colors.mantle },
				YankHighlight = { bg = colors.surface2 },
				FidgetTask = { fg = colors.subtext2 },
				FidgetTitle = { fg = colors.peach },

				IblIndent = { fg = colors.surface0 },
				IblScope = { fg = colors.overlay0 },

				Boolean = { fg = colors.mauve },
				Number = { fg = colors.mauve },
				Float = { fg = colors.mauve },

				PreProc = { fg = colors.mauve },
				PreCondit = { fg = colors.mauve },
				Include = { fg = colors.mauve },
				Define = { fg = colors.mauve },
				Conditional = { fg = colors.red },
				Repeat = { fg = colors.red },
				Keyword = { fg = colors.red },
				Typedef = { fg = colors.red },
				Exception = { fg = colors.red },
				Statement = { fg = colors.red },

				Error = { fg = colors.red },
				StorageClass = { fg = colors.peach },
				Tag = { fg = colors.peach },
				Label = { fg = colors.peach },
				Structure = { fg = colors.peach },
				Operator = { fg = colors.peach },
				Title = { fg = colors.peach },
				Special = { fg = colors.yellow },
				SpecialChar = { fg = colors.yellow },
				Type = { fg = colors.yellow, style = { "bold" } },
				Function = { fg = colors.green, style = { "bold" } },
				Delimiter = { fg = colors.subtext2 },
				Ignore = { fg = colors.subtext2 },
				Macro = { fg = colors.teal },

				TSAnnotation = { fg = colors.mauve },
				TSAttribute = { fg = colors.mauve },
				TSBoolean = { fg = colors.mauve },
				TSCharacter = { fg = colors.teal },
				TSCharacterSpecial = { link = "SpecialChar" },
				TSComment = { link = "Comment" },
				TSConditional = { fg = colors.red },
				TSConstBuiltin = { fg = colors.mauve },
				TSConstMacro = { fg = colors.mauve },
				TSConstant = { fg = colors.text },
				TSConstructor = { fg = colors.green },
				TSDebug = { link = "Debug" },
				TSDefine = { link = "Define" },
				TSEnvironment = { link = "Macro" },
				TSEnvironmentName = { link = "Type" },
				TSError = { link = "Error" },
				TSException = { fg = colors.red },
				TSField = { fg = colors.blue },
				TSFloat = { fg = colors.mauve },
				TSFuncBuiltin = { fg = colors.green },
				TSFuncMacro = { fg = colors.green },
				TSFunction = { fg = colors.green },
				TSFunctionCall = { fg = colors.green },
				TSInclude = { fg = colors.red },
				TSKeyword = { fg = colors.red },
				TSKeywordFunction = { fg = colors.red },
				TSKeywordOperator = { fg = colors.peach },
				TSKeywordReturn = { fg = colors.red },
				TSLabel = { fg = colors.peach },
				TSLiteral = { link = "String" },
				TSMath = { fg = colors.blue },
				TSMethod = { fg = colors.green },
				TSMethodCall = { fg = colors.green },
				TSNamespace = { fg = colors.yellow },
				TSNone = { fg = colors.text },
				TSNumber = { fg = colors.mauve },
				TSOperator = { fg = colors.peach },
				TSParameter = { fg = colors.text },
				TSParameterReference = { fg = colors.text },
				TSPreProc = { link = "PreProc" },
				TSProperty = { fg = colors.blue },
				TSPunctBracket = { fg = colors.text },
				TSPunctDelimiter = { link = "Delimiter" },
				TSPunctSpecial = { fg = colors.blue },
				TSRepeat = { fg = colors.red },
				TSStorageClass = { fg = colors.peach },
				TSStorageClassLifetime = { fg = colors.peach },
				TSStrike = { fg = colors.subtext2 },
				TSString = { fg = colors.teal },
				TSStringEscape = { fg = colors.green },
				TSStringRegex = { fg = colors.green },
				TSStringSpecial = { link = "SpecialChar" },
				TSSymbol = { fg = colors.text },
				TSTag = { fg = colors.peach },
				TSTagAttribute = { fg = colors.green },
				TSTagDelimiter = { fg = colors.green },
				TSText = { fg = colors.green },
				TSTextReference = { link = "Constant" },
				TSTitle = { link = "Title" },
				TSTodo = { link = "Todo" },
				TSType = { fg = colors.yellow, style = { "bold" } },
				TSTypeBuiltin = { fg = colors.yellow, style = { "bold" } },
				TSTypeDefinition = { fg = colors.yellow, style = { "bold" } },
				TSTypeQualifier = { fg = colors.peach, style = { "bold" } },
				TSURI = { fg = colors.blue },
				TSVariable = { fg = colors.text },
				TSVariableBuiltin = { fg = colors.mauve },

				["@annotation"] = { link = "TSAnnotation" },
				["@attribute"] = { link = "TSAttribute" },
				["@boolean"] = { link = "TSBoolean" },
				["@character"] = { link = "TSCharacter" },
				["@character.special"] = { link = "TSCharacterSpecial" },
				["@comment"] = { link = "TSComment" },
				["@conceal"] = { link = "Grey" },
				["@conditional"] = { link = "TSConditional" },
				["@constant"] = { link = "TSConstant" },
				["@constant.builtin"] = { link = "TSConstBuiltin" },
				["@constant.macro"] = { link = "TSConstMacro" },
				["@constructor"] = { link = "TSConstructor" },
				["@debug"] = { link = "TSDebug" },
				["@define"] = { link = "TSDefine" },
				["@error"] = { link = "TSError" },
				["@exception"] = { link = "TSException" },
				["@field"] = { link = "TSField" },
				["@float"] = { link = "TSFloat" },
				["@function"] = { link = "TSFunction" },
				["@function.builtin"] = { link = "TSFuncBuiltin" },
				["@function.call"] = { link = "TSFunctionCall" },
				["@function.macro"] = { link = "TSFuncMacro" },
				["@include"] = { link = "TSInclude" },
				["@keyword"] = { link = "TSKeyword" },
				["@keyword.function"] = { link = "TSKeywordFunction" },
				["@keyword.operator"] = { link = "TSKeywordOperator" },
				["@keyword.return"] = { link = "TSKeywordReturn" },
				["@label"] = { link = "TSLabel" },
				["@math"] = { link = "TSMath" },
				["@method"] = { link = "TSMethod" },
				["@method.call"] = { link = "TSMethodCall" },
				["@namespace"] = { link = "TSNamespace" },
				["@none"] = { link = "TSNone" },
				["@number"] = { link = "TSNumber" },
				["@operator"] = { link = "TSOperator" },
				["@parameter"] = { link = "TSParameter" },
				["@parameter.reference"] = { link = "TSParameterReference" },
				["@preproc"] = { link = "TSPreProc" },
				["@property"] = { link = "TSProperty" },
				["@punctuation.bracket"] = { link = "TSPunctBracket" },
				["@punctuation.delimiter"] = { link = "TSPunctDelimiter" },
				["@punctuation.special"] = { link = "TSPunctSpecial" },
				["@repeat"] = { link = "TSRepeat" },
				["@storageclass"] = { link = "TSStorageClass" },
				["@storageclass.lifetime"] = { link = "TSStorageClassLifetime" },
				["@strike"] = { link = "TSStrike" },
				["@string"] = { link = "TSString" },
				["@string.escape"] = { link = "TSStringEscape" },
				["@string.regex"] = { link = "TSStringRegex" },
				["@string.special"] = { link = "TSStringSpecial" },
				["@symbol"] = { link = "TSSymbol" },
				["@tag"] = { link = "TSTag" },
				["@tag.attribute"] = { link = "TSTagAttribute" },
				["@tag.delimiter"] = { link = "TSTagDelimiter" },
				["@text"] = { link = "TSText" },
				["@text.danger"] = { link = "TSDanger" },
				["@text.diff.add"] = { link = "diffAdded" },
				["@text.diff.delete"] = { link = "diffRemoved" },
				["@text.emphasis"] = { link = "TSEmphasis" },
				["@text.environment"] = { link = "TSEnvironment" },
				["@text.environment.name"] = { link = "TSEnvironmentName" },
				["@text.literal"] = { link = "TSLiteral" },
				["@text.math"] = { link = "TSMath" },
				["@text.note"] = { link = "TSNote" },
				["@text.reference"] = { link = "TSTextReference" },
				["@text.strike"] = { link = "TSStrike" },
				["@text.strong"] = { link = "TSStrong" },
				["@text.title"] = { link = "TSTitle" },
				["@text.todo"] = { link = "TSTodo" },
				["@text.todo.checked"] = { link = "Green" },
				["@text.todo.unchecked"] = { link = "Ignore" },
				["@text.underline"] = { link = "TSUnderline" },
				["@text.uri"] = { link = "TSURI" },
				["@text.warning"] = { link = "TSWarning" },
				["@todo"] = { link = "TSTodo" },
				["@type"] = { link = "TSType" },
				["@type.builtin"] = { link = "TSTypeBuiltin" },
				["@type.definition"] = { link = "TSTypeDefinition" },
				["@type.qualifier"] = { link = "TSTypeQualifier" },
				["@uri"] = { link = "TSURI" },
				["@variable"] = { link = "TSVariable" },
				["@variable.builtin"] = { link = "TSVariableBuiltin" },

				["@lsp.type.class"] = { link = "TSType" },
				["@lsp.type.comment"] = { link = "TSComment" },
				["@lsp.type.decorator"] = { link = "TSFunction" },
				["@lsp.type.enum"] = { link = "TSType" },
				["@lsp.type.enumMember"] = { link = "TSProperty" },
				["@lsp.type.events"] = { link = "TSLabel" },
				["@lsp.type.function"] = { link = "TSFunction" },
				["@lsp.type.interface"] = { link = "TSType" },
				["@lsp.type.keyword"] = { link = "TSKeyword" },
				["@lsp.type.macro"] = { link = "TSConstMacro" },
				["@lsp.type.method"] = { link = "TSMethod" },
				["@lsp.type.modifier"] = { link = "TSTypeQualifier" },
				["@lsp.type.namespace"] = { link = "TSNamespace" },
				["@lsp.type.number"] = { link = "TSNumber" },
				["@lsp.type.operator"] = { link = "TSOperator" },
				["@lsp.type.parameter"] = { link = "TSParameter" },
				["@lsp.type.property"] = { link = "TSProperty" },
				["@lsp.type.regexp"] = { link = "TSStringRegex" },
				["@lsp.type.string"] = { link = "TSString" },
				["@lsp.type.struct"] = { link = "TSType" },
				["@lsp.type.type"] = { link = "TSType" },
				["@lsp.type.typeParameter"] = { link = "TSTypeDefinition" },
				["@lsp.type.variable"] = { link = "TSVariable" },
			}
		end,
		latte = function(colors)
			return {
				IblIndent = { fg = colors.mantle },
				IblScope = { fg = colors.surface1 },

				LineNr = { fg = colors.surface1 },
			}
		end,
	},
})
-- vim.cmd("colors catppuccin")
-- vim.cmd("highlight clear TreesitterContextBottom")

-- Default options
require("nightfox").setup({
	options = {
		-- Compiled file's destination location
		compile_path = vim.fn.stdpath("cache") .. "/nightfox",
		compile_file_suffix = "_compiled", -- Compiled file suffix
		transparent = true, -- Disable setting background
		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
		dim_inactive = false, -- Non focused panes set to alternative background
		module_default = true, -- Default enable value for modules
		colorblind = {
			enable = false, -- Enable colorblind support
			simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
			severity = {
				protan = 0, -- Severity [0,1] for protan (red)
				deutan = 0, -- Severity [0,1] for deutan (green)
				tritan = 0, -- Severity [0,1] for tritan (blue)
			},
		},
		styles = { -- Style to be applied to different syntax groups
			comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
			conditionals = "NONE",
			constants = "NONE",
			functions = "NONE",
			keywords = "NONE",
			numbers = "NONE",
			operators = "NONE",
			strings = "NONE",
			types = "NONE",
			variables = "NONE",
		},
		inverse = { -- Inverse highlight for different types
			match_paren = false,
			visual = false,
			search = false,
		},
		modules = { -- List of various plugins and additional options
			-- ...
		},
	},
	palettes = {},
	specs = {},
	groups = {},
})

local c = require("vscode.colors").get_colors()
require("vscode").setup({
	-- Enable transparent background
	-- transparent = true,

	-- Enable italic comment
	italic_comments = true,

	-- Underline `@markup.link.*` variants
	underline_links = true,

	-- Disable nvim-tree background color
	disable_nvimtree_bg = true,

	-- Override colors (see ./lua/vscode/colors.lua)
	color_overrides = {
		vscLineNumber = "#5a5a5a",
	},

	-- Override highlight groups (see ./lua/vscode/theme.lua)
	group_overrides = {
		-- Change the color of the empty line symbols (`~`)
		EndOfBuffer = { fg = "#5a5a5a" },
		-- this supports the same val table as vim.api.nvim_set_hl
		-- use colors from this colorscheme by requiring vscode.colors!
		Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
		CursorLine = { bg = "#2E2E2E" },
		-- Override LSP Diagnostic Colors
		DiagnosticError = { fg = "#D16969", bg = "" }, -- light red
		DiagnosticWarn = { fg = "#D7BA7D", bg = "" }, -- light yellow
		DiagnosticInfo = { fg = "#9CDCFE", bg = "" }, -- light blue
		DiagnosticHint = { fg = "#9CDCFE", bg = "" }, -- light green
		-- Floating window customization
		NormalFloat = { bg = "#1F1F1F" },
		-- FloatBorder = { fg = "", bg = "#1F1F1F" },
	},
})

-- vim.cmd("colorscheme vscode")
-- vim.cmd("colorscheme melange")

-- setup must be called before loading
-- vim.cmd("colorscheme carbonfox")

local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "x", "o" }, "<leader>tg", ":colorscheme gruvbox<CR>", opts)
vim.keymap.set({ "n", "x", "o" }, "<leader>to", ":colorscheme onedark<CR>", opts)
-- vim.keymap.set({ "n", "x", "o" }, "<leader>ta", ":colorscheme ayu<CR>", opts)

-- require("one").colorscheme()
