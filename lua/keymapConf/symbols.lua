-- <nixCats>/lua/keymapConf/symbols.lua
-- <leader>s: Document symbol list,

-- Symbol menu by aerial
vim.keymap.set("n", "<leader>so", "<cmd>AerialToggle<CR>", { desc = "Aerial menu" })
vim.keymap.set("n", "<leader>sO", "<cmd>AerialToggle!<CR>", { desc = "Aerial menu (no focus)" })
vim.keymap.set("n", "<leader>sn", "<cmd>AerialNavToggle<CR>", { desc = "Aerial navigation" })
vim.keymap.set("n", "<leader>sN", require("aerial").snacks_picker, { desc = "Aerial navigation (snacks)" })

-- Neotree
vim.keymap.set("n", "<leader>sf", "<cmd>Neotree focus float document_symbols<CR>", { desc = "Neotree symbols" })

-- Trouble
vim.keymap.set("n", "<leader>st", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Trouble symbols" })
