-- <nixCats>/lua/keymapConf/init.lua
-- Keybinds entry point

-- Keybinds for each functionality
-- require("keymapConf.buffer")
-- require("keymapConf.debug")
require("keymapConf.files")
require("keymapConf.git")
-- require("keymapConf.lint")
-- require("keymapConf.search")
-- require("keymapConf.tab")
-- require("keymapConf.ui")
-- require("keymapConf.window")

-- Load which-key group names
local wk_status, wk = pcall(require, "which-key")
if wk_status then
  wk.add({
    { "<Leader>b", group = "(B)uffer functions" },
    { "<Leader>d", group = "(D)ebug" },
    { "<Leader>f", group = "(F)ile operations" },
    { "<Leader>g", group = "(Git) functions" },
    { "<Leader>l", group = "(C)ode linting & formatting" },
    { "<Leader>s", group = "(S)earch functions" },
    { "<Leader>t", group = "(T)ab functions" },
    { "<Leader>u", group = "(U)I elements" },
    { "<Leader>w", group = "(W)indow functions" },
  })
end
