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
  { 'folke/which-key.nvim' },

  { 'nvim-tree/nvim-web-devicons' },

  -- Git
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim' },

  -- Automatically close parantheses, brackets, etc
  { 'windwp/nvim-autopairs' },

  'j-hui/fidget.nvim',
}
