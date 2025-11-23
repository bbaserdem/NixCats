-- <nixCats>/lua/keymapConf/debug.lua
-- <Leader>d: Debugging functions

-- Trouble
vim.keymap.set(
  "n",
  "<Leader>dX",
  "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
  { desc = "Diagnostics (trouble)" }
)
vim.keymap.set("n", "<Leader>dX", "<cmd>Trouble diagnostics toggle<CR>", { desc = "All diagnostics (trouble)" })
