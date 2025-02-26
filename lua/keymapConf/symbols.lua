-- <nixCats>/lua/keymapConf/symbols.lua
-- <leader>s: Document symbol list,

-- Function calls
local _aerialSnacks = function()
  require("aerial").snacks_picker()
end

-- Symbol menu by aerial
vim.keymap.set("n", "<leader>so", "<cmd>AerialToggle<CR>", { desc = "Aerial menu" })
vim.keymap.set("n", "<leader>sO", "<cmd>AerialToggle!<CR>", { desc = "Aerial menu (no focus)" })
vim.keymap.set("n", "<leader>sn", "<cmd>AerialNavToggle<CR>", { desc = "Aerial navigation" })
vim.keymap.set("n", "<leader>sN", _aerialSnacks, { desc = "Aerial navigation (snacks)" })
