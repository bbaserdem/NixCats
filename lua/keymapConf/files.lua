-- <nixCats>/lua/keymapConf/files.lua
-- <Leader>f: File operations

-- Yazi
vim.keymap.set("n", "<Leader>fy", "<cmd>Yazi cwd<CR>", { desc = "Launch Yazi (working dir)" })
vim.keymap.set("n", "<Leader>fY", "<cmd>Yazi<CR>", { desc = "Launch Yazi (current file)" })

-- Oil
vim.keymap.set("n", "<Leader>fo", "<cmd>Oil<CR>", { desc = "Launch Oil" })

-- Neotree
vim.keymap.set("n", "<Leader>ft", "<cmd>Neotree left toggle<CR>", { desc = "Toggle Neotree (left column)" })
vim.keymap.set("n", "<Leader>fT", "<cmd>Neotree float toggle<CR>", { desc = "Toggle Neotree (float)" })

-- Telescope
vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Search for files in cwd" })
vim.keymap.set("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Grep for files in cwd" })
