 return {
   {
     'VonHeikemen/lsp-zero.nvim',
     branch = 'v2.x',
     lazy = true,
     config = function()
       -- This is where you modify the settings for lsp-zero
       -- Note: autocompletion settings will not take effect
       require('lsp-zero.settings').preset({})
     end
   },

   -- LSP
   {
     'neovim/nvim-lspconfig',
     cmd = 'LspInfo',
     event = {'BufReadPre', 'BufNewFile'},
     dependencies = {
       {'hrsh7th/cmp-nvim-lsp'},
       {'williamboman/mason-lspconfig.nvim'},
       {
         'williamboman/mason.nvim',
         build = function()
           pcall(vim.cmd, 'MasonUpdate')
         end,
       },
     },
     config = function()
       -- This is where all the LSP shenanigans will live
       local lsp = require('lsp-zero')

       lsp.on_attach(function(_, bufnr)
         local function map(mode, lhs, rhs)
           vim.keymap.set(mode, lhs, rhs, { buffer= bufnr })
         end

         map('n', 'gd', function() vim.lsp.buf.definition() end)
         map('n', 'gD', function() vim.lsp.buf.declaration() end)
         map('n', 'gi', vim.lsp.buf.implementation)
         map('n', 'gr', require('telescope.builtin').lsp_references)
         map('n', 'gR', vim.lsp.buf.references)

         map('n', 'K', function() vim.lsp.buf.hover() end)
         map({ 'n', 'i' }, '<C-s>', vim.lsp.buf.signature_help)
         map('n', '<leader>vca', function() vim.lsp.buf.code_action() end)
         map('n', '<leader>vrn', function() vim.lsp.buf.rename() end)

         map('n', '<leader>li', vim.lsp.buf.incoming_calls)
         map('n', '<leader>lo', vim.lsp.buf.outgoing_calls)
         map('n', '<leader>lt', vim.lsp.buf.document_symbol)

         map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder)
         map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder)
         map('n', '<leader>wl', function()
           print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
         end)

         map('n', '<leader>vd', function() vim.diagnostic.open_float() end)
         map('n', '[d', function() vim.diagnostic.goto_next() end)
         map('n', ']d', function() vim.diagnostic.goto_prev() end)
       end)

       -- (Optional) Configure lua language server for neovim
       -- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

       lsp.setup()
     end
   }
 }
