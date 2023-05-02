return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {'onsails/lspkind-nvim'},
    {'L3MON4D3/LuaSnip'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},
    {'saadparwaiz1/cmp_luasnip'},
    {'rafamadriz/friendly-snippets'},
  },
  config = function()
    -- Here is where you configure the autocompletion settings.
    -- The arguments for .extend() have the same shape as `manage_nvim_cmp`: 
    -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp
    require('lsp-zero.cmp').extend()
    require('luasnip.loaders.from_vscode').lazy_load()

    -- And you can configure cmp even more, if you want to.
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local cmp_action = require('lsp-zero.cmp').action()

    cmp.setup({
      mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-y>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },

        ['<tab>'] = cmp_action.luasnip_jump_forward(),
        ['<S-tab>'] = cmp_action.luasnip_jump_backward(),
      },

      sources = {
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 5 },
      },

      snippet = {
        expand = function(args)
          require('luansnip').lsp_expand(args.body)
        end,
      },

      formatting = {
        format = lspkind.cmp_format {
          with_text = true,
          menu = {
            buffer = '[buf]',
            nvim_lsp = '[LSP]',
            nvim_lua = '[api]',
            path = '[path]',
            luasnip = '[snip]',
          },
        },
      },

      experimental = {
        native_menu = false,
        ghost_text = true,
      },
    })
  end
}
