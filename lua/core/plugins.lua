local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'unblevable/quick-scope'
Plug 'psf/black'
vim.call('plug#end')

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use { "ellisonleao/gruvbox.nvim" }
    use { "catppuccin/nvim", as = "catppuccin" }
    use "rebelot/kanagawa.nvim"
    use 'folke/tokyonight.nvim'
    use 'tiagovla/tokyodark.nvim'
    use "savq/melange-nvim"
    use 'APZelos/blamer.nvim'
    use "sainnhe/gruvbox-material"
    use 'navarasu/onedark.nvim'
    use "lukas-reineke/indent-blankline.nvim"
    use 'HiPhish/nvim-ts-rainbow2'
    use 'kiyoon/treesitter-indent-object.nvim'
    use 'nvim-treesitter/nvim-treesitter-context'
    use {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            }
        end
    }
    use {
        'rmagatti/session-lens',
        requires = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
        config = function()
            require('session-lens').setup({ --[[your custom config--]] })
        end
    }
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })
    use 'ghostbuster91/nvim-next'
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use 'NTBBloodbath/doom-one.nvim'
    use({
        "glepnir/lspsaga.nvim",
        opt = true,
        branch = "main",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup({
                symbol_in_winbar = {
                    enable = false,
                },
            })
        end,
        requires = {
            { "nvim-tree/nvim-web-devicons" },
            --Please make sure you install markdown and markdown_inline parser
            { "nvim-treesitter/nvim-treesitter" }
        }
    })
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup(
                {
                    current_line_blame_opts = {
                        virt_text = true,
                        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                        delay = 0,
                        ignore_whitespace = false,
                    },
                }
            )
        end
    }
    use 'fedepujol/move.nvim'
    -- Lua
    -- use {
    --     "folke/which-key.nvim",
    --     config = function()
    --         vim.o.timeout = true
    --         vim.o.timeoutlen = 300
    --         require("which-key").setup {
    --             -- your configuration comes here
    --             -- or leave it empty to use the default settings
    --             -- refer to the configuration section below
    --         }
    --     end
    -- }
    -- Packer
    use "sindrets/diffview.nvim"
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'
    use {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {}
        end
    }
    use 'nvim-lualine/lualine.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
    }
    use { 'Everblush/nvim', as = 'everblush' }
    use {
        'numToStr/Navigator.nvim',
        config = function()
            require('Navigator').setup()
        end
    }
    use 'haishanh/night-owl.vim'
    use 'tpope/vim-fugitive'
    use { 'L3MON4D3/LuaSnip' }
    -- use 'airblade/vim-gitgutter'
    use "princejoogie/tailwind-highlight.nvim"
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'dmitmel/cmp-cmdline-history'
    -- use {
    --     'VonHeikemen/fine-cmdline.nvim',
    --     requires = {
    --         { 'MunifTanjim/nui.nvim' }
    --     }
    -- }
    -- Lua

    use {
        'olivercederborg/poimandres.nvim',
        config = function()
            require('poimandres').setup {
                -- leave this setup function empty for default config
                -- or refer to the configuration section
                -- for configuration options
            }
        end
    }
    use 'hrsh7th/cmp-nvim-lsp-document-symbol'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'onsails/lspkind.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }
    -- use 'RRethy/vim-illuminate'
    use 'tpope/vim-surround'
    use {
        'sudormrfbin/cheatsheet.nvim',

        requires = {
            { 'nvim-telescope/telescope.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
        }
    }
    use { "akinsho/horizon.nvim", tag = "*" }
    use { 'akinsho/git-conflict.nvim',
        tag = "*",
        config = function()
            require('git-conflict').setup()
        end
    }
    use {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    }
    use {
        'gelguy/wilder.nvim',
        config = function()
            -- config goes here
        end,
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'nvimdev/zephyr-nvim'
    use 'RRethy/nvim-base16'
    use 'Shatur/neovim-ayu'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { "LinArcX/telescope-command-palette.nvim" }
    -- My plugins here
    -- use 'foo1/bar1.nvim'
    -- use 'foo2/bar2.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
