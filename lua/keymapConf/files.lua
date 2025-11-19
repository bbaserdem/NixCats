-- <nixCats>/lua/keymapConf/files.lua
-- <Leader>f: File operations

vim.keymap.set("n", "<Leader>fy", "<cmd>Yazi cwd<CR>", { desc = "Launch Yazi (working dir)" })
vim.keymap.set("n", "<Leader>fY", "<cmd>Yazi<CR>", { desc = "Launch Yazi (current file)" })
vim.keymap.set("n", "<Leader>fo", "<cmd>Oil<CR>", { desc = "Launch Oil" })
