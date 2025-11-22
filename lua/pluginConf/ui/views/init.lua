-- <nixCats>/lua/pluginConf/ui/init.lua
-- Lazy loaded plugins config

-- Plugin configs, with one call to lze
local M = {
  { import = "pluginConf.ui.views.aerial" },
  { import = "pluginConf.ui.views.fidget" },
  { import = "pluginConf.ui.views.snacks" },
  { import = "pluginConf.ui.views.trouble" },
  { import = "pluginConf.ui.views.twilight" },
  { import = "pluginConf.ui.views.which-key" },
}

return M
