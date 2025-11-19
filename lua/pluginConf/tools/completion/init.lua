-- <nixCats>/lua/pluginConf/tools/completion/init.lua

-- Plugin configs, with one call to lze
local M = {
  { import = "pluginConf.tools.completion.cmp" },
  { import = "pluginConf.tools.completion.luasnip" },
  { import = "pluginConf.tools.completion.sources" },
}

return M
