-- <nixCats>/lua/pluginConf/tools/init.lua
-- Lazy loaded plugins config

-- Plugin configs, with one call to lze
local M = {
  { import = "pluginConf.tools.completion" },
  { import = "pluginConf.tools.debug" },
  { import = "pluginConf.tools.files" },
  { import = "pluginConf.tools.formatting" },
  { import = "pluginConf.tools.git" },
  -- { import = "pluginConf.tools.motions"},
  -- { import = "pluginConf.tools.search"},
  -- { import = "pluginConf.tools.snippets"},
  -- { import = "pluginConf.tools.treesitter"},
  -- { import = "pluginConf.tools.utility"},
}

return M
