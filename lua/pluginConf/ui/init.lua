-- <nixCats>/lua/pluginConf/ui/init.lua
-- Lazy loaded plugins config

-- Plugin configs, with one call to lze
local M = {
  -- {import = "pluginConf.ui.bar"},
  -- {import = "pluginConf.ui.icons"},
  { import = "pluginConf.ui.theme" },
  { import = "pluginConf.ui.picker" },
  -- {import = "pluginConf.ui.views"},
}

return M
