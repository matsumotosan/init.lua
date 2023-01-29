local indent_scope = require('mini.indentscope')

indent_scope.setup({
  event = "BufReadPre",
  symbol = "│",
  options = {
    try_as_border = true
  }
})
