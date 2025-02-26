-- <nixCats>/lua/keymapConf/lint.lua
-- <Leader>l: Linting and styling
local conform_keymap = require("lzextras").keymap("conform.nvim")

-- Symbol menu by aerial
conform_keymap.set({ "n", "v" }, "<Leader>lf", require("conform").format, { desc = "Formatter (conform)" })
