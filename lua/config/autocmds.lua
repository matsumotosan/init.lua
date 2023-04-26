local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  command = "checktime",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup('lsp_attach'),
  desc = 'LSP keymaps',
  callback = function(args)
    local bufnr = args.buf
    local function map(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
    end

    map('n', 'gD', vim.lsp.buf.declaration)
    map('n', 'gd', vim.lsp.buf.definition)
    map('n', 'K', vim.lsp.buf.hover)
    map('n', 'gi', vim.lsp.buf.implementation)
    map({ 'n', 'i' }, '<C-s>', vim.lsp.buf.signature_help)
    map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder)
    map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder)
    map('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end)
    map('n', '<leader>D', vim.lsp.buf.type_definition)
    map('n', '<leader>r', function()
      require('conf.nui_lsp').lsp_rename()
    end)
    map('n', 'gr', function()
      require('trouble').open { mode = 'lsp_references' }
    end)
    map('n', 'gR', vim.lsp.buf.references)
    map('n', '<leader>li', vim.lsp.buf.incoming_calls)
    map('n', '<leader>lo', vim.lsp.buf.outgoing_calls)
    map('n', '<leader>lt', vim.lsp.buf.document_symbol)
    map('n', '<leader>d', function()
      vim.diagnostic.open_float {
        {
          scope = 'line',
          border = 'single',
          focusable = false,
          severity_sort = true,
        },
      }
    end)
    map('n', '[d', function()
      vim.diagnostic.goto_prev { float = false }
    end)
    map('n', ']d', function()
      vim.diagnostic.goto_next { float = false }
    end)
    map('n', '[e', function()
      vim.diagnostic.goto_prev {
        enable_popup = false,
        severity = { min = vim.diagnostic.severity.WARN },
      }
    end)
    map('n', ']e', function()
      vim.diagnostic.goto_next {
        enable_popup = false,
        severity = { min = vim.diagnostic.severity.WARN },
      }
    end)
    map('n', '<leader>q', vim.diagnostic.setloclist)
    map('n', '<leader>ls', vim.lsp.buf.document_symbol)
    map('n', '<leader>lS', vim.lsp.buf.workspace_symbol)
    vim.opt.shortmess:append 'c'
  end,
})
