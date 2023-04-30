return {
  { -- theme
    'catppuccin/nvim',
    lazy = false,
    name = 'catppuccin',
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
  },

  -- Useful plugin to show you pending keybinds
  { 'folke/which-key.nvim' , opts = {} },
  { 'windwp/nvim-autopairs', opts = {} },
  {'j-hui/fidget.nvim', opts = {} },
  { 'nvim-tree/nvim-web-devicons' , opts = {} },

  -- Git
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',
}
