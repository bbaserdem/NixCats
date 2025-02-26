-- <nixCats>/lua/keymapConf/lint.lua
-- <Leader>l: Linting and styling

-- Symbol menu by aerial
vim.keymap.set({ "n", "v" }, "<Leader>lf", require("conform").format, { desc = "Formatter (conform)" })
