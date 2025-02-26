-- <nixCats>/lua/keymapConf/navigation.lua
-- <Leader>n: Navigation keybinds

-- Hydra mode entry
-- vim.keymap.set(
--   "n",
--   "<Leader>n<Leader>",
--   function()
--     local wk = require("which-key")
--     wk.show({ keys = "<Leader>n", loop = true })
--   end,
--   { desc = "Previous buffer" }
-- )

-- Buffer mappings
vim.keymap.set("n", "<Leader>n[", "<cmd>bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<Leader>n]", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<Leader>n$", "<cmd>blast<CR>", { desc = "Last buffer" })
vim.keymap.set("n", "<Leader>n0", "<cmd>bfirst<CR>", { desc = "First buffer" })
vim.keymap.set("n", "<Leader>nn", "<cmd>enew<CR><Esc>", { desc = "New (empty) buffer" })
-- vim.keymap.set(
--   "n",
--   "<Leader>nd",
--   function()
--     local Snacks = require("snacks")
--     Snacks.bufdelete.delete()
--   end,
--   { desc = "Delete buffer" }
-- )
-- vim.keymap.set(
--   "n",
--   "<Leader>nD",
--   function()
--     local Snacks = require("snacks")
--     Snacks.bufdelete.all()
--   end,
--   { desc = "Delete all buffers" }
-- )
-- Neotree
vim.keymap.set("n", "<Leader>nb", "<cmd>Neotree focus float buffers<CR>", { desc = "Buffer list (neotree)" })

-- Window mappings (dual hjkl and arrow navigation)
vim.keymap.set("n", "<Leader>n<Left>", "<cmd>wincmd h<CR>", { desc = "Move to left window" })
vim.keymap.set("n", "<Leader>nh", "<cmd>wincmd h<CR>", { desc = "Move to left window" })
vim.keymap.set("n", "<Leader>n<Right>", "<cmd>wincmd l<CR>", { desc = "Move to right window" })
vim.keymap.set("n", "<Leader>nl", "<cmd>wincmd l<CR>", { desc = "Move to right window" })
vim.keymap.set("n", "<Leader>n<Up>", "<cmd>wincmd k<CR>", { desc = "Move to window above" })
vim.keymap.set("n", "<Leader>nk", "<cmd>wincmd k<CR>", { desc = "Move to window above" })
vim.keymap.set("n", "<Leader>n<Down>", "<cmd>wincmd j<CR>", { desc = "Move to window below" })
vim.keymap.set("n", "<Leader>nj", "<cmd>wincmd j<CR>", { desc = "Move to window below" })
vim.keymap.set("n", "<Leader>nq", "<cmd>close<CR>", { desc = "Close this window" })
vim.keymap.set("n", "<Leader>ns", "<cmd>split<CR>", { desc = "Horizontal split window" })
vim.keymap.set("n", "<Leader>nv", "<cmd>split<CR>", { desc = "Vertical split window" })

-- Tab mappings
vim.keymap.set("n", "<Leader>no", "<cmd>tab split<CR>", { desc = "Open a new tab" })
vim.keymap.set("n", "<Leader>nO", "<cmd>tabnew<CR>", { desc = "Open new tab with empty buffer" })
vim.keymap.set("n", "<Leader>nc", "<cmd>tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<Leader>nC", "<cmd>tabclose<CR>", { desc = "Close all other tabs" })
vim.keymap.set("n", "<Leader>n<Tab>", "<cmd>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<Leader>n<S-Tab>", "<cmd>tabprev<CR>", { desc = "Previous tab" })
