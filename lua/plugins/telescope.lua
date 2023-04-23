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

-- return {
--   'nvim-telescope/telescope.nvim',
--   cmd = "Telescope",
--   version = '*',
--   dependencies = { 'nvim-lua/plenary.nvim' },
--   keys = {
    -- search
    -- { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
    -- { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
    -- { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    -- { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
    -- { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
    -- { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
    --   { "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
    --   { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
    --   { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
    --   { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
    --   { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
    --   { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    --   { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
    --   { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
    --   { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
    --   { "<leader>sw", Util.telescope("grep_string"), desc = "Word (root dir)" },
    --   { "<leader>sW", Util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
    --   { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    --   {
    --     "<leader>ss",
    --     Util.telescope("lsp_document_symbols", {
    --       symbols = {
    --         "Class",
    --         "Function",
    --         "Method",
    --         "Constructor",
    --         "Interface",
    --         "Module",
    --         "Struct",
    --         "Trait",
    --         "Field",
    --         "Property",
    --       },
    --     }),
    --     desc = "Goto Symbol",
    --   },
    --   {
    --     "<leader>sS",
    --     Util.telescope("lsp_dynamic_workspace_symbols", {
    --       symbols = {
    --         "Class",
    --         "Function",
    --         "Method",
    --         "Constructor",
    --         "Interface",
    --         "Module",
    --         "Struct",
    --         "Trait",
    --         "Field",
    --         "Property",
    --       },
    --     }),
    --     desc = "Goto Symbol (Workspace)",
    --   },
  -- },
  -- opts = {
    --   defaults = {
    --     prompt_prefix = " ",
    --     selection_caret = " ",
    --     mappings = {
    --       i = {
    --         ["<c-t>"] = function(...)
    --           return require("trouble.providers.telescope").open_with_trouble(...)
    --         end,
    --         ["<a-t>"] = function(...)
    --           return require("trouble.providers.telescope").open_selected_with_trouble(...)
    --         end,
    --         ["<a-i>"] = function()
    --           Util.telescope("find_files", { no_ignore = true })()
    --         end,
    --         ["<a-h>"] = function()
    --           Util.telescope("find_files", { hidden = true })()
    --         end,
    --         ["<C-Down>"] = function(...)
    --           return require("telescope.actions").cycle_history_next(...)
    --         end,
    --         ["<C-Up>"] = function(...)
    --           return require("telescope.actions").cycle_history_prev(...)
    --         end,
    --         ["<C-f>"] = function(...)
    --           return require("telescope.actions").preview_scrolling_down(...)
    --         end,
    --         ["<C-b>"] = function(...)
    --           return require("telescope.actions").preview_scrolling_up(...)
    --         end,
    --       },
    --       n = {
    --         ["q"] = function(...)
    --           return require("telescope.actions").close(...)
    --         end,
    --       },
    --     },
    --   },
--   },
-- }
