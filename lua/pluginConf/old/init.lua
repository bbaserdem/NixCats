-- <nixCats>/lua/pluginConf/init.lua
-- Lazy loaded plugins config

-- Register lze handler with the spec field 'for_cat' before any lazy loading
require("lze").register_handlers(require("nixCatsUtils.lzUtils").for_cat)
require("lze").register_handlers(require("nixCatsUtils.lzUtils").in_extra)

-- Bootstrap plugins if needed first
require("pluginConf.paq")

-- Plugin configs, with one call to lze
require("lze").load({
  { import = "pluginConf.aerial" },
})
