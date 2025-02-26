-- <nixCats>/lua/keymapConf/symbols.lua
-- Document symbol list, <leader>s prefix

-- Function calls
local _aerialSnacks = function()
  require("aerial").snacks_picker()
end

-- Symbol menu by aerial
vim.keymap.set("n", "<leader>so", "<cmd>AerialToggle<CR>", { desc = "Aerial menu" })
vim.keymap.set("n", "<leader>sO", "<cmd>AerialToggle!<CR>", { desc = "Aerial menu (no focus)" })
vim.keymap.set("n", "<leader>sn", "<cmd>AerialNavToggle<CR>", { desc = "Aerial navigation" })
vim.keymap.set("n", "<leader>sN", _aerialSnacks, { desc = "Aerial navigation (snacks)" })
