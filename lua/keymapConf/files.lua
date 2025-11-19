-- <nixCats>/lua/keymapConf/files.lua
-- <Leader>f: File operations

-- Yazi
vim.keymap.set("n", "<Leader>fy", "<cmd>Yazi cwd<CR>", { desc = "Launch Yazi (working dir)" })
vim.keymap.set("n", "<Leader>fY", "<cmd>Yazi<CR>", { desc = "Launch Yazi (current file)" })

-- Oil
vim.keymap.set("n", "<Leader>fo", "<cmd>Oil<CR>", { desc = "Launch Oil" })

-- Neotree
vim.keymap.set("n", "<Leader>ft", "<cmd>Neotree left<CR>", { desc = "Toggle Neotree (left column)" })
vim.keymap.set("n", "<Leader>fT", "<cmd>Neotree float<CR>", { desc = "Toggle Neotree (float)" })
