-- <nixCats>/lua/pluginConf/lazy/init.lua
-- Lazy loaded plugins config

-- Register lze handler with the spec field 'for_cat' before any lazy loading
require('lze').register_handlers(require('nixCatsUtils.lzUtils').for_cat)

-- We do requires for involved setups, do calls to lze there
require('pluginConf.lazy.colorscheme')
require('pluginConf.lazy.completion')

-- Plugin configs
require('lze').load {
    { import = 'pluginConf.lazy.lazydev', },
    { import = 'pluginConf.lazy.treesitter', },
}
