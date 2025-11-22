-- <nixCats>/lua/pluginConf/ui/init.lua
-- Lazy loaded plugins config

-- Plugin configs, with one call to lze
local M = {
  { import = "pluginConf.ui.bar.lualine" },
  { import = "pluginConf.ui.bar.tabby" },
}

return M
