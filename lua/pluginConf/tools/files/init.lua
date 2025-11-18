-- <nixCats>/lua/pluginConf/tools/files/init.lua

-- Plugin configs, with one call to lze
local M = {
  -- { import = "pluginConf.tools.files"},
  { import = "pluginConf.tools.files.neo-tree" },
  { import = "pluginConf.tools.files.oil" },
  { import = "pluginConf.tools.files.yazi" },
}

return M
