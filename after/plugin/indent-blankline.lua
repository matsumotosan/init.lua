local indent_blankline = require('indent_blankline')

indent_blankline.setup({
  event = "BufReadPost",
  char = "│",
  show_current_context = false,
  show_current_context_start = false,
})
