-- <nixCats>/lua/keymapConf/ui.lua
-- <Leader>u: UI elements

-- Aerial
vim.keymap.set("n", "<Leader>us", "<cmd>AerialToggle<CR>", { desc = "Toggle Aerial: [s]ymbols" })
vim.keymap.set("n", "<Leader>uS", "<cmd>AerialNavToggle<CR>", { desc = "Toggle Aerial navigation: [s]ymbols" })

-- Map
vim.keymap.set("n", "<Leader>um", "<cmd>lua MiniMap.toggle()<CR>", { desc = "Toggle [M]iniMap" })
