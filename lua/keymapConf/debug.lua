-- <nixCats>/lua/keymapConf/debug.lua
-- <Leader>d: Debugging functions

-- Diagnostics
vim.keymap.set("n", "zk", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- Trouble
vim.keymap.set(
  "n",
  "<Leader>dX",
  "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
  { desc = "Diagnostics (trouble)" }
)
vim.keymap.set("n", "<Leader>dX", "<cmd>Trouble diagnostics toggle<CR>", { desc = "All diagnostics (trouble)" })
vim.keymap.set(
  "n",
  "<Leader>dX",
  "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
  { desc = "Diagnostics (trouble)" }
)
vim.keymap.set("n", "<Leader>dq", "<cmd>Trouble qflist toggle<CR>", { desc = "QuickFix (trouble)" })
vim.keymap.set(
  "n",
  "<Leader>dl",
  "<cmd>Trouble lsp toggle focus=fase win.position=right<CR>",
  { desc = "LSP definition, reference, ... (trouble)" }
)
vim.keymap.set("n", "<Leader>dL", "<cmd>Trouble loclist toggle<CR>", { desc = "Location list (trouble)" })

-- Telescope
vim.keymap.set("n", "<Leader>dd", "<cmd>Telescope diagnostics<CR>", { desc = "Search diagnostics" })
