local keymap = vim.keymap

keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Press jk fast to esc
keymap.set("i", "kj", "<Esc>")

-- Move blocks of code
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append line below
keymap.set("n", "J", "mzJ`z")

-- Navigate without moving cursor
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Yank into void register
keymap.set("x", "<leader>p", [["_dP]])

-- System clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [[\"+Y]])
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

keymap.set("n", "Q", "<nop>")

-- Change project folder
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
keymap.set("n", "<leader>f", vim.lsp.buf.format)

--
keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")

-- Replace current work
keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- New tab
keymap.set("n", "te", ":tabedit")

-- Split window
keymap.set("n", "<leader>ss", ":split<CR><C-w>w")
keymap.set("n", "<leader>sv", ":vsplit<CR><C-w>w")

-- Move window
keymap.set("", "<leader>wh", "<C-w>h")
keymap.set("", "<leader>wk", "<C-w>k")
keymap.set("", "<leader>wj", "<C-w>j")
keymap.set("", "<leader>wl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Change buffers
keymap.set("n", "<tab>", ":bnext<CR>")
keymap.set("n", "<S-tab>", ":bprev<CR>")

-- Save file
-- keymap.set("n", "<C-s>", ":w<CR>")
