-- <nixCats>/lua/keymapConf/ui.lua
-- <Leader>u: UI elements

-- Function keys
vim.keymap.set("n", "<F3>", "<cmd>DarkLightSwitch<CR>", { desc = "Toggle light/dark mode" })

-- Aerial
vim.keymap.set("n", "<Leader>us", "<cmd>AerialToggle<CR>", { desc = "Toggle Aerial: [s]ymbols" })
vim.keymap.set("n", "<Leader>uS", "<cmd>AerialNavToggle<CR>", { desc = "Toggle Aerial navigation: [s]ymbols" })

-- Map
vim.keymap.set("n", "<Leader>um", "<cmd>lua MiniMap.toggle()<CR>", { desc = "Toggle [M]iniMap" })
