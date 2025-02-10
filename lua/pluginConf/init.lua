-- <nixCats>/lua/pluginConf/init.lua
-- Plugin configuration

-- Load config options for non-lazy plugins
require('pluginConf.startup')

-- Load lazy loading plugins (using lze.nvim)
require('pluginConf.lazy')
