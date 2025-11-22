-- <nixCats>/lua/pluginConf/languages/init.lua
-- Lazy loaded plugins config

-- Plugin configs, with one call to lze
local M = {
  { import = "pluginConf.languages.latex" },
  { import = "pluginConf.languages.lua" },
  { import = "pluginConf.languages.markdown" },
  { import = "pluginConf.languages.python" },
}

return M
