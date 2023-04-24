return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = 'Telescope',
  version = '*',
  keys = {
    -- search
    { '<leader>sr', '<cmd>Telescope oldfiles<cr>', desc = 'Search recently opened files' },
    { '<leader>sb', '<cmd>Telescope buffers<cr>', desc = 'Search buffers' },
    { '<leader>sh', '<cmd>Telescope help_tags<cr>', desc = 'Search help' },
    { '<leader>sf', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
    { '<leader>sw', '<cmd>Telescope grep_string<cr>', desc = 'Search word' },
    { '<leader>sg', '<cmd>Telescope live_grep<cr>', desc = 'Search by grep' },
    { '<leader>sd', '<cmd>Telescope diagnostics<cr>', desc = 'Search diagnostics' },
    { '<leader>scb', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Search current buffer' },

    -- git
    { "<leader>sgc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
    { "<leader>sgs", "<cmd>Telescope git_status<CR>", desc = "status" },
  },
}
