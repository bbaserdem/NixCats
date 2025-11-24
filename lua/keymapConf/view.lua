-- <nixCats>/lua/keymapConf/view.lua
-- <Leader>v: View (window + tab) management

-- Window navigation
vim.keymap.set("n", "<Leader>v<Left>", "<cmd>wincmd h<CR>", { desc = "Left window" })
vim.keymap.set("n", "<Leader>v<Down>", "<cmd>wincmd j<CR>", { desc = "Window below" })
vim.keymap.set("n", "<Leader>v<Up>", "<cmd>wincmd k<CR>", { desc = "Window above" })
vim.keymap.set("n", "<Leader>v<Right>", "<cmd>wincmd l<CR>", { desc = "Left window" })
vim.keymap.set("n", "<Leader>vd", "<cmd>close<CR>", { desc = "Close window" })
vim.keymap.set("n", "<Leader>vs", "<cmd>split<CR>", { desc = "Horizontal split window" })
vim.keymap.set("n", "<Leader>vv", "<cmd>vsplit<CR>", { desc = "Vertical split window" })

-- Also have window navigation in all modes
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", { noremap = true, silent = true, desc = "Left window (term)" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", { noremap = true, silent = true, desc = "Window below (term)" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", { noremap = true, silent = true, desc = "Window above (term)" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", { noremap = true, silent = true, desc = "Right window (term)" })
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Left window" })
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Window below" })
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Window above" })
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Right window" })

-- Tab navigation
vim.keymap.set("n", "<Leader>vn", "<cmd>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<Leader>vN", "<cmd>tabprev<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<Leader>vo", "<cmd>tab split<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<Leader>vO", "<cmd>tabnew<CR>", { desc = "Open new empty tab" })
vim.keymap.set("n", "<Leader>vx", "<cmd>tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<Leader>vX", "<cmd>tabonly<CR>", { desc = "Close all other tabs" })

-- Other navigation
vim.keymap.set("n", "<Leader>vj", "<cmd>Telescope jumplist<CR>", { desc = "View jump list entries" })
