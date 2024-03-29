local keymap = vim.keymap.set

keymap({"n", "v"}, "<C-r>+", '"+p')

keymap({"n", "v"}, "<Leader>nt", ":set number! relativenumber!<CR>")

---
-- Buffers
---
keymap("n", "<C-l>", ":bn<CR>", { silent = true })
keymap("n", "<C-h>", ":bp<CR>", { silent = true })
keymap("n", "<Leader>d", ":bd<CR>", { silent = true })
keymap("n", "<Leader>ad", ":%bd<CR>", { silent = true })

---
-- Tabs
---
keymap("v", "<Tab>", ">gv")
keymap("v", "<S-Tab>", "<gv")

---
-- Move lines vertically
---
keymap("n", "<C-j>", ":m .+1<CR>==")
keymap("v", "<C-j>", ":m '>+1<CR>gv=gv")
keymap("n", "<C-k>", ":m .-2<CR>==")
keymap("v", "<C-k>", ":m '<-2<CR>gv=gv")

