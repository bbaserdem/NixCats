-- <nixCats>/lua/keymapConf/debug.lua
-- <Leader>d: Debugging functions

-- FN actions; F5 toggle debug, F9 toggle breakpoint, F10/11 steop over/into-out
vim.keymap.set("n", "<F5>", "<cmd>DapNew<CR>", { desc = "Start DAP session" })
vim.keymap.set("n", "<F17>", "<cmd>DapTerminate<CR>", { desc = "End DAP session" })
vim.keymap.set("n", "<F9>", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<F10>", "<cmd>DapStepOver<CR>", { desc = "Step over" })
vim.keymap.set("n", "<F11>", "<cmd>DapStepInto<CR>", { desc = "Step into" })
vim.keymap.set("n", "<F23>", "<cmd>DapStepOut<CR>", { desc = "Step out" })

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

-- Debug functionality
