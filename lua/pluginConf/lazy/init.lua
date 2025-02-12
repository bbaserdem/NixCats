-- <nixCats>/lua/pluginConf/lazy/init.lua
-- Lazy loaded plugins config

-- Register lze handler with the spec field 'for_cat' before any lazy loading
require('lze').register_handlers(require('nixCatsUtils.lzUtils').for_cat)

-- We do requires for involved setups, do calls to lze there
require('pluginConf.lazy.colorscheme')
require('pluginConf.lazy.completion')

-- Plugin configs
require('lze').load {
  { import = 'pluginConf.lazy.util', },
  { import = 'pluginConf.lazy.dap', },
  { import = 'pluginConf.lazy.treesitter', },
  { import = 'pluginConf.lazy.aerial', },
  { import = 'pluginConf.lazy.mini', },
  { import = 'pluginConf.lazy.lazydev', },
  { import = 'pluginConf.lazy.whichKey', },
  { import = 'pluginConf.lazy.git', },
  { import = 'pluginConf.lazy.markdown', },
  { import = 'pluginConf.lazy.conform', },
  { import = 'pluginConf.lazy.trouble', },
  { import = 'pluginConf.lazy.lint', },
}
