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
	{ "ellisonleao/gruvbox.nvim" },
	{ "catppuccin/nvim", name = "catppuccin" },
	"rebelot/kanagawa.nvim",
	"folke/tokyonight.nvim",
	"tiagovla/tokyodark.nvim",
	"savq/melange-nvim",
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"mfussenegger/nvim-dap-python",
	"APZelos/blamer.nvim",
	"sainnhe/gruvbox-material",
	"navarasu/onedark.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"HiPhish/nvim-ts-rainbow2",
	"kiyoon/treesitter-indent-object.nvim",
	"nvim-treesitter/nvim-treesitter-context",
	"windwp/nvim-ts-autotag",
	"rmagatti/auto-session",
	"folke/trouble.nvim",
	"psf/black",
	"unblevable/quick-scope",
	{
		"rmagatti/session-lens",
		dependencies = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
		config = function()
			require("session-lens").setup({ --[[your custom config--]]
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-treesitter" },
	},
	"ghostbuster91/nvim-next",
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	"NTBBloodbath/doom-one.nvim",
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
		commit = "4f07545",
	},
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
	"fedepujol/move.nvim",
	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup()
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	"sindrets/diffview.nvim",
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({})
		end,
	},
	"nvim-lualine/lualine.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},
	{ "Everblush/nvim", name = "everblush" },
	{
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup()
		end,
	},
	"haishanh/night-owl.vim",
	"tpope/vim-fugitive",
	{ "L3MON4D3/LuaSnip" },
	-- use 'airblade/vim-gitgutter'
	"princejoogie/tailwind-highlight.nvim",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"dmitmel/cmp-cmdline-history",
	{
		"olivercederborg/poimandres.nvim",
		config = function()
			require("poimandres").setup({
				-- leave this setup function empty for default config
				-- or refer to the configuration section
				-- for configuration options
			})
		end,
	},
	"hrsh7th/cmp-nvim-lsp-document-symbol",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"onsails/lspkind.nvim",
	"norcalli/nvim-colorizer.lua",
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup()
		end,
	},
	"tpope/vim-surround",
	{
		"sudormrfbin/cheatsheet.nvim",

		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	},
	{ "akinsho/horizon.nvim", version = "*" },
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = function()
			require("git-conflict").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"gelguy/wilder.nvim",
		config = function()
			-- config goes here
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	"nvimdev/zephyr-nvim",
	"RRethy/nvim-base16",
	"Shatur/neovim-ayu",
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.2",
		-- or                            , branch = '0.1.x',
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{ "LinArcX/telescope-command-palette.nvim" },
}
local opts = {}
return require("lazy").setup(plugins, opts)
