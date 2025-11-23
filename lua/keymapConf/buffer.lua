-- <nixCats>/lua/keymapConf/buffer.lua
-- <Leader>b: Buffer management and navigation

vim.keymap.set("n", "<Leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<Leader>bN", "<cmd>bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<Leader>bg", "<cmd>bfirst<CR>", { desc = "First buffer" })
vim.keymap.set("n", "<Leader>bG", "<cmd>blast<CR>", { desc = "Last buffer" })
vim.keymap.set("n", "<Leader>be", "<Esc><cmd>enew<CR>", { desc = "New (e)mpty buffer" })
vim.keymap.set("n", "<Leader>bd", "<cmd>Bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<Leader>bl", "<cmd>Telescope buffers<CR>", { desc = "List buffers" })
