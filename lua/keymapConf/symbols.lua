-- <nixCats>/lua/keymapConf/symbols.lua
-- <Leader>s: Document symbol list,

-- Symbol menu by aerial
vim.keymap.set("n", "<Leader>so", "<cmd>AerialToggle<CR>", { desc = "Aerial menu" })
vim.keymap.set("n", "<Leader>sO", "<cmd>AerialToggle!<CR>", { desc = "Aerial menu (no focus)" })
vim.keymap.set("n", "<Leader>sn", "<cmd>AerialNavToggle<CR>", { desc = "Aerial navigation" })
vim.keymap.set("n", "<Leader>sN", function()
  require("aerial").snacks_picker()
end, { desc = "Aerial navigation (snacks)" })

-- Neotree
vim.keymap.set("n", "<Leader>sf", "<cmd>Neotree focus float document_symbols<CR>", { desc = "Neotree symbols" })

-- Trouble
vim.keymap.set("n", "<Leader>st", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Trouble symbols" })
