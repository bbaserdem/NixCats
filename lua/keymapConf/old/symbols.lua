-- <nixCats>/lua/keymapConf/symbols.lua
-- <Leader>s: Document symbol list,
local aerial_keymap = require("lzextras").keymap("aerial.nvim")
local snacks_keymap = require("lzextras").keymap("snacks.nvim")

-- Symbol menu by aerial
vim.keymap.set("n", "<Leader>so", "<cmd>AerialToggle<CR>", { desc = "Aerial menu" })
vim.keymap.set("n", "<Leader>sO", "<cmd>AerialToggle!<CR>", { desc = "Aerial menu (no focus)" })
vim.keymap.set("n", "<Leader>sn", "<cmd>AerialNavToggle<CR>", { desc = "Aerial navigation" })
aerial_keymap.set("n", "<Leader>sN", function()
  require("aerial").snacks_picker()
end, { desc = "Aerial navigation (snacks)" })

-- Neotree
vim.keymap.set("n", "<Leader>sf", "<cmd>Neotree focus float document_symbols<CR>", { desc = "Neotree symbols" })

-- Trouble
vim.keymap.set("n", "<Leader>st", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Trouble symbols" })

-- Snacks
snacks_keymap.set("n", "<Leader>sd", function()
  require("snacks").picker.lsp_definitions()
end, { desc = "Goto definition" })
snacks_keymap.set("n", "<Leader>sD", function()
  require("snacks").picker.lsp_declarations()
end, { desc = "Goto declaration" })
snacks_keymap.set("n", "<Leader>sr", function()
  require("snacks").picker.lsp_references()
end, { desc = "References" })
snacks_keymap.set("n", "<Leader>sI", function()
  require("snacks").picker.lsp_implementations()
end, { desc = "Goto Implementation" })
snacks_keymap.set("n", "<Leader>sy", function()
  require("snacks").picker.lsp_type_definitions()
end, { desc = "Goto type definition" })
snacks_keymap.set("n", "<Leader>ss", function()
  require("snacks").picker.lsp_symbols()
end, { desc = "LSP Symbols (snacks)" })
snacks_keymap.set("n", "<Leader>sS", function()
  require("snacks").picker.lsp_workspace_symbols()
end, { desc = "LSP Workplace Symbols (snacks)" })
