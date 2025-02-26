-- <nixCats>/lua/keymapConf/ui.lua
-- <leader>u: Visual stuff

-- Fidget status toggles
vim.keymap.set({ "n", "v" }, "<leader>uf", "<cmd>Fidget suppress<CR>", { desc = "Toggle LSP info (fidget)" })
vim.keymap.set({ "n", "v" }, "<leader>uF", "<cmd>Fidget history<CR>", { desc = "Show LSP status history (fidget)" })

-- Mason & lsp config
vim.keymap.set("n", "<leader>ul", "<cmd>LspInfo<CR>", { desc = "Open LSPconfig menu" })
vim.keymap.set("n", "<leader>uL", "<cmd>Mason<CR>", { desc = "Open Mason menu" })
vim.keymap.set("n", "<leader>up", "<cmd>PaqSync<CR>", { desc = "Sync packages (paq)" })

-- Mini Map
vim.keymap.set("n", "<leader>um", require("mini.map").toggle, { desc = "Toggle minimap" })
vim.keymap.set("n", "<leader>uM", require("mini.map").toggle_focus, { desc = "Focus minimap" })
vim.keymap.set("n", "<leader>u<C-m>", require("mini.map").toggle_side, { desc = "Switch side for minimap" })

-- File browsers
vim.keymap.set("n", "<leader>ut", "<cmd>Neotree focus<CR>", { desc = "Go to Neotree" })
vim.keymap.set("n", "<leader>uT", "<cmd>Neotree focus float<CR>", { desc = "Floating Neotree" })
vim.keymap.set("n", "<leader>u<C-T>", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neotree" })
vim.keymap.set("n", "<leader>uo", "<cmd>Oil<CR>", { desc = "Open Oil" })
