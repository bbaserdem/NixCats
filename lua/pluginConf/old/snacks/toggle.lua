-- <nixCats>/lua/pluginConf/snacks/toggle.lua
-- Configuration of toggle things

return {
  enabled = true,
  map = require("lzextras").keymap("snacks.nvim").set,
  notify = true,
}
