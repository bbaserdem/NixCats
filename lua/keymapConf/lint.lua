-- <nixCats>/lua/keymapConf/lint.lua
-- <leader>l: Linting and styling

-- Symbol menu by aerial
vim.keymap.set({ "n", "v" }, "<leader>lf", require("conform").format, { desc = "Formatter (conform)" })
