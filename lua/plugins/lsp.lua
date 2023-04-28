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
         local opts = { buffer = bufnr, remap = false}

         vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
         vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
         vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references, opts)
         vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
         vim.keymap.set("n", "gK", function() vim.lsp.buf.signature_help() end, opts)
         vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
         -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
         vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
         vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
         vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
         vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
         -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
         vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
       end)

       -- (Optional) Configure lua language server for neovim
       -- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

       lsp.setup()
     end
   }
 }
