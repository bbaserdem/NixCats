-- <nixCats>/lua/keymapConf/navigation.lua
-- Navigation keybinds; <leader>n
local sb = require("snacks").bufdelete
local wk = require("which-key")

-- Hydra mode entry
vim.keymap.set("n", "<leader>n<leader>", function()
  wk.show({ keys = "<leader>n", loop = true })
end, { desc = "Previous buffer" })

-- Buffer mappings
vim.keymap.set("n", "<leader>n[", "<cmd>bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>n]", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>n$", "<cmd>blast<CR>", { desc = "Last buffer" })
vim.keymap.set("n", "<leader>n0", "<cmd>bfirst<CR>", { desc = "First buffer" })
vim.keymap.set("n", "<leader>nd", sb.delete, { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>nD", sb.all, { desc = "Delete all buffers" })
vim.keymap.set("n", "<leader>nn", "<cmd>enew<CR><Esc>", { desc = "New (empty) buffer" })

-- Window mappings (dual hjkl and arrow navigation)
vim.keymap.set("n", "<leader>n<Left>", "<cmd>wincmd h<CR>", { desc = "Move to left window" })
vim.keymap.set("n", "<leader>nh", "<cmd>wincmd h<CR>", { desc = "Move to left window" })
vim.keymap.set("n", "<leader>n<Right>", "<cmd>wincmd l<CR>", { desc = "Move to right window" })
vim.keymap.set("n", "<leader>nl", "<cmd>wincmd l<CR>", { desc = "Move to right window" })
vim.keymap.set("n", "<leader>n<Up>", "<cmd>wincmd k<CR>", { desc = "Move to window above" })
vim.keymap.set("n", "<leader>nk", "<cmd>wincmd k<CR>", { desc = "Move to window above" })
vim.keymap.set("n", "<leader>n<Down>", "<cmd>wincmd j<CR>", { desc = "Move to window below" })
vim.keymap.set("n", "<leader>nj", "<cmd>wincmd j<CR>", { desc = "Move to window below" })
vim.keymap.set("n", "<leader>nq", "<cmd>close<CR>", { desc = "Close this window" })
vim.keymap.set("n", "<leader>ns", "<cmd>split<CR>", { desc = "Horizontal split window" })
vim.keymap.set("n", "<leader>nv", "<cmd>split<CR>", { desc = "Vertical split window" })

-- Tab mappings
vim.keymap.set("n", "<leader>no", "<cmd>tab split<CR>", { desc = "Open a new tab" })
vim.keymap.set("n", "<leader>nO", "<cmd>tabnew<CR>", { desc = "Open new tab with empty buffer" })
vim.keymap.set("n", "<leader>nc", "<cmd>tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>nC", "<cmd>tabclose<CR>", { desc = "Close all other tabs" })
vim.keymap.set("n", "<leader>n<Tab>", "<cmd>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>n<S-Tab>", "<cmd>tabprev<CR>", { desc = "Previous tab" })
