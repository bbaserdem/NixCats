-- <nixCats>/lua/pluginConf/init.lua
-- Plugins config

-- We do requires, and let plugins call lze.load on their own
require('pluginConf.completion')

-- Plugin configs
require('lze').load {
    { import = 'pluginConf.lazydev', },
    { import = 'pluginConf.treesitter', },
}
