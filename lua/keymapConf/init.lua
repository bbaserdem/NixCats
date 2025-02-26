-- <nixCats>/lua/keymapConf/init.lua
-- Keybinds entry point

-- Keybinds for each functionality
require("keymapConf.clipboard")
require("keymapConf.diagnostics")
require("keymapConf.git")
require("keymapConf.lint")
require("keymapConf.navigation")
require("keymapConf.symbols")
require("keymapConf.ui")

-- Load which-key group names
local wk = require("which-key")
wk.add({
  { "<Leader>d", group = "Diagnostics" },
  { "<Leader>g", group = "Git Functions" },
  { "<Leader>l", group = "Linting & Formatting" },
  { "<Leader>n", group = "Navigation" },
  { "<Leader>s", group = "Symbols" },
  { "<Leader>u", group = "Elements with UI" },
})
