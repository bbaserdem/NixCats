-- <nixCats>/lua/keymapConf/diagnostics.lua
-- Diagnostic keymaps

-- [] navigation
vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to next diagnostic message" })

-- Float menu
vim.keymap.set("n", "zk", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "zK", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
