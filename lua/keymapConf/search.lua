-- <nixCats>/lua/keymapConf/search.lua
-- <Leader>s: Search functionalities

-- vim.keymap.set("n", "<Leader>fy", "<cmd>Yazi cwd<CR>", { desc = "Launch Yazi (working dir)" })
vim.keymap.set("n", "<Leader>su", "<cmd>UrlView buffer<CR>", { desc = "Get buffer [u]rls" })
vim.keymap.set("n", "<Leader>s<Space>", "<cmd>Telescope builtin<CR>", { desc = "Search pickers" })
vim.keymap.set("n", "<Leader>sc", "<cmd>Telescope colorscheme<CR>", { desc = "Search [c]olorschemes" })
vim.keymap.set("n", "<Leader>sC", "<cmd>Telescope highlights<CR>", { desc = "Search [c]olor highlights" })
vim.keymap.set("n", "<Leader>so", "<cmd>Telescope oldfiles<CR>", { desc = "Search previously [o]pen files" })
vim.keymap.set("n", "<Leader>sh", "<cmd>Telescope helptags<CR>", { desc = "Search [h]elp tags" })
vim.keymap.set("n", "<Leader>sm", "<cmd>Telescope man_pages<CR>", { desc = "Search [m]an pages" })
vim.keymap.set("n", "<Leader>sr", "<cmd>Telescope registers<CR>", { desc = "Search [r]egisters" })
