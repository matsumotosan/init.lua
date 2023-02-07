local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    -- Color scheme
    use('catppuccin/nvim')
    use('nvim-tree/nvim-web-devicons')
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    }

    -- File navigation
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use('theprimeagen/harpoon')

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/nvim-treesitter-context')

    -- Statusline and bufferline
    use('nvim-lualine/lualine.nvim')
    use('moll/vim-bbye')
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

    -- Indent guides
    use('lukas-reineke/indent-blankline.nvim')
    use('echasnovski/mini.nvim')

    -- Undotree
    use('mbbill/undotree')

    -- Git
    use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup()
        end,
        requires = { "nvim-lua/plenary.nvim" },
    })

    -- Diagnostics
    use('folke/trouble.nvim')

    -- Testing
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-plenary",
            "folke/neodev.nvim"
        }
    }

    -- Commenting
    use('numToStr/Comment.nvim')
    use {
        'kkoomen/vim-doge',
        run = ':call doge#install()'
    }
    use("folke/todo-comments.nvim")

    -- Auto brakcets
    use('windwp/nvim-autopairs')

    -- Zen mode
    use('folke/zen-mode.nvim')

    -- DAP
    use('mfussenegger/nvim-dap')
    use('mfussenegger/nvim-dap-python')

    -- Terminal
    use('akinsho/toggleterm.nvim')
    use('christoomey/vim-tmux-navigator')

    -- Navigation
    use('ggandor/leap.nvim')

    if packer_bootstrap then
        require('packer').sync()
    end
end)
