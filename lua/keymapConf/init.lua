-- <nixCats>/lua/keymapConf/init.lua
-- Keybinds entry point
-- <leader>l is taken sortof by vimtex; let's leave it alone for now.

-- Keybinds for each functionality
require("keymapConf.ai")
require("keymapConf.buffer")
require("keymapConf.code")
require("keymapConf.debug")
require("keymapConf.files")
require("keymapConf.git")
require("keymapConf.search")
require("keymapConf.ui")
require("keymapConf.view")

-- Load which-key group names
local wk_status, wk = pcall(require, "which-key")
if wk_status then
  wk.add({
    { "<Leader>a", group = "[A]I tools" },
    { "<Leader>b", group = "[B]uffer functions" },
    { "<Leader>c", group = "[C]ode linting & formatting" },
    { "<Leader>d", group = "[D]ebug" },
    { "<Leader>f", group = "[F]ile operations" },
    { "<Leader>g", group = "[G]it functions" },
    { "<Leader>s", group = "[S]earch functions" },
    { "<Leader>u", group = "[U]I elements" },
    { "<Leader>v", group = "[V]iew (windows + tabs) functions" },
  })
end
