return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/nvim-treesitter-context',
  },
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'cpp',
      'cmake',
      'dockerfile',
      'json',
      'lua',
      'markdown',
      'markdown_inline',
      'python',
      'vim',
      'vimdoc',
      'yaml',
    },
  }
}
