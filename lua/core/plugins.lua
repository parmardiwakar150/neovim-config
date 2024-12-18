local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- colorschemes
	{ "ellisonleao/gruvbox.nvim", lazy = true },
	{ "catppuccin/nvim", name = "catppuccin", lazy = true },
	{ "rebelot/kanagawa.nvim", lazy = true },
	{ "folke/tokyonight.nvim", lazy = true },
	{ "EdenEast/nightfox.nvim" },
	{ "tiagovla/tokyodark.nvim", lazy = true },
	{ "savq/melange-nvim", lazy = true },
	{ "drewtempelmeyer/palenight.vim", lazy = true },
	{ "JoosepAlviste/palenightfall.nvim", lazy = true },
	{ "sainnhe/gruvbox-material", lazy = true },
	{ "navarasu/onedark.nvim", lazy = true },
	{ "NTBBloodbath/doom-one.nvim", lazy = true },
	"projekt0n/github-nvim-theme",
	"rmehri01/onenord.nvim",
	"Alexis12119/nightly.nvim",
	"mellow-theme/mellow.nvim",
	"matthewmturner/tuscany",
	{
		"sainnhe/sonokai",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.sonokai_enable_italic = false
			vim.g.sonokai_transparent_background = 1
			vim.g.sonokai_float_style = "dim"
		end,
	},
	{
		"sainnhe/edge",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.sonokai_enable_italic = false
			vim.g.edge_transparent_background = 1
			vim.g.edge_float_style = "dim"
		end,
	},
	{ "nvimdev/zephyr-nvim", lazy = true },
	{ "RRethy/nvim-base16", lazy = true },
	{ "Shatur/neovim-ayu", lazy = true },
	{ "hiszd/fleet.nvim", lazy = true },
	{ "disrupted/one.nvim", lazy = true },
	{ "haishanh/night-owl.vim", lazy = true },
	{ "akinsho/horizon.nvim", version = "*", lazy = true },
	{ "Everblush/nvim", name = "everblush", lazy = true },
	{
		"olivercederborg/poimandres.nvim",
		lazy = true,
		config = function()
			require("poimandres").setup({
				-- leave this setup function empty for default config
				-- or refer to the configuration section
				-- for configuration options
			})
		end,
	},

	-- debugger
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	},
	"mfussenegger/nvim-dap-python",
	"leoluz/nvim-dap-go",
	"theHamsta/nvim-dap-virtual-text",

	-- session
	"rmagatti/auto-session",
	{
		"rmagatti/session-lens",
		dependencies = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
		config = function()
			require("session-lens").setup({ --[[your custom config--]]
			})
		end,
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},
	{ "lukas-reineke/indent-blankline.nvim", version = "2.20.8" },
	"hiphish/rainbow-delimiters.nvim",
	"kiyoon/treesitter-indent-object.nvim",
	{
		"Wansmer/treesj",
		config = function()
			require("treesj").setup({
				max_join_length = 1000,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-treesitter" },
	},

	-- LSP
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"glepnir/lspsaga.nvim",
		lazy = true,
		branch = "main",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({
				symbol_in_winbar = {
					enable = false,
				},
				lightbulb = {
					enable = false,
				},
			})
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
		},
		-- commit = "4f07545",
	},

	-- completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"dmitmel/cmp-cmdline-history",
	"hrsh7th/cmp-nvim-lsp-document-symbol",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/cmp-calc",
	{ "L3MON4D3/LuaSnip" },

	-- git
	{ "sindrets/diffview.nvim" },
	-- "tpope/vim-fugitive",
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 0,
					ignore_whitespace = false,
					update_debounce = 5000,
				},
			})
		end,
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		-- version = "0.1.2",
		branch = "0.1.x",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{ "nvim-telescope/telescope-live-grep-args.nvim" },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{ "biozz/whop.nvim", opts = {} },

	-- miscellaneous
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	{ "folke/trouble.nvim" },
	-- "psf/black",
	"unblevable/quick-scope",
	"ghostbuster91/nvim-next",
	"tpope/vim-surround",
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"numToStr/Navigator.nvim",
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"abecodes/tabout.nvim",
		dependencies = { "nvim-treesitter", "nvim-cmp" },
	},
}
local opts = {
	install = { colorscheme = { "tokyonight" } },
	ui = { border = "rounded" },
}
return require("lazy").setup(plugins, opts)
