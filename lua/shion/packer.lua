-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Color scheme
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  -- Treesitter
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')

  -- File tree
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Harpoon
  use('theprimeagen/harpoon')

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

  -- CoC 
  --  use {'neoclide/coc.nvim', branch = 'release'}

  -- Commenting
  use('numToStr/Comment.nvim')

  -- Auto brakcets
  use('windwp/nvim-autopairs')

  -- Zen mode
  use('folke/zen-mode.nvim')

  -- DAP
  use('mfussenegger/nvim-dap')
  use('mfussenegger/nvim-dap-python')

  -- ToggleTerm
  use('akinsho/toggleterm.nvim')

  -- Navigation
  use('ggandor/leap.nvim')
end)
