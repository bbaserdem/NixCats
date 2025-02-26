-- <nixCats>/lua/keymapConf/ui.lua
-- <Leader>u: Visual stuff
local minimap_keymap = require("lzextras").keymap("mini.nvim")

-- Fidget status toggles
vim.keymap.set({ "n", "v" }, "<Leader>uf", "<cmd>Fidget suppress<CR>", { desc = "Toggle LSP info (fidget)" })
vim.keymap.set({ "n", "v" }, "<Leader>uF", "<cmd>Fidget history<CR>", { desc = "Show LSP status history (fidget)" })

-- Mason & lsp config
vim.keymap.set("n", "<Leader>ul", "<cmd>LspInfo<CR>", { desc = "Open LSPconfig menu" })
vim.keymap.set("n", "<Leader>uL", "<cmd>Mason<CR>", { desc = "Open Mason menu" })
vim.keymap.set("n", "<Leader>up", "<cmd>PaqSync<CR>", { desc = "Sync packages (paq)" })

-- Mini Map; accesed by m letter, managed by mini
minimap_keymap.set("n", "<Leader>um", function()
  require("mini.map").toggle()
end, { desc = "Toggle minimap" })
minimap_keymap.set("n", "<Leader>uM", function()
  require("mini.map").toggle_focus()
end, { desc = "Focus minimap" })
minimap_keymap.set("n", "<Leader>u<C-m>", function()
  require("mini.map").toggle_side()
end, { desc = "Switch side for minimap" })

-- File browsers
vim.keymap.set("n", "<Leader>ut", "<cmd>Neotree focus<CR>", { desc = "Go to Neotree" })
vim.keymap.set("n", "<Leader>uT", "<cmd>Neotree focus float<CR>", { desc = "Floating Neotree" })
vim.keymap.set("n", "<Leader>u<C-T>", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neotree" })
vim.keymap.set("n", "<Leader>uo", "<cmd>Oil<CR>", { desc = "Open Oil" })
