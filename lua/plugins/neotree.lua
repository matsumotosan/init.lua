return {
  'nvim-neo-tree/neo-tree.nvim',
  cmd = "Neotree",
  version = '*',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
  },
  config = function()
    require("neo-tree").setup()
  end,
  opts = {
    options = {
      close_if_last_window = true,
      enable_diagnostics = false,
      source_selector = {
        winbar = true,
        content_layout = "center",
        tab_labels = {
          filesystem = " File",
          buffers = "➜ Buffs",
          git_status = " Git",
          diagnostics = "",
        },
      },
      default_component_configs = {
        indent = {
          padding = 0,
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
        },
        git_status = {
          symbols = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
          },
        },
      },
      window = {
        width = 30,
        mappings = {
          ["o"] = "open",
          ["v"] = "open_vsplit",
        },
      },
      filesystem = {
        follow_current_file = true,
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },
}
