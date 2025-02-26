-- <nixCats>/lua/keymapConf/ui.lua
-- <leader>u: Visual stuff

-- Fidget status toggles
vim.keymap.set({ "n", "v" }, "<leader>lf", "<cmd>Fidget suppress<CR>", { desc = "Toggle LSP info (fidget)" })
vim.keymap.set({ "n", "v" }, "<leader>lF", "<cmd>Fidget history<CR>", { desc = "Show LSP status history (fidget)" })
