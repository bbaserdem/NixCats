-- <nixCats>/lua/pluginConf/snacks/debug.lua
-- Pretty print dump of objects

_G.dd = function(...)
  require("snacks").debug.inspect(...)
end
_G.bt = function()
  require("snacks").debug.backtrace()
end
vim.print = _G.dd

return { enabled = true }
