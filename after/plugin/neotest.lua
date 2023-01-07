local neotest = require('neotest')
-- local opts = { noremap = true, silent = true }

neotest.setup({
    adapters = {
        require("neotest-python")({
            dap = { justMyCode = false },
            runner = "pytest"
        }),
        -- require("neotest-plenary"),
    --     require("neotest-vim-test")({
    --         ignore_file_types = { "python", "vim", "lua" },
    --     }),
    },
})

vim.keymap.set("n", "<leader>ta", neotest.run.attach--[[ , opts %]])
vim.keymap.set("n", "<leader>tc", neotest.run.run--[[ , opts %]])
vim.keymap.set("n", "<leader>tt", function() neotest.run.run(vim.fn.expand("%")) end--[[ , opts %]])
-- vim.keymap.set("n", "<leader>to", neotest.run.open, opts)
