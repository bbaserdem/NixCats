-- <nixCats>/lua/pluginConf/init.lua
-- Lazy loaded plugins config

-- Explicitly load bigfile from snacks if requested
if require('nixCatsUtils').getCatOrDefault('main', true) == true then
  require('snacks').bigfile.setup()
end

-- Register lze handler with the spec field 'for_cat' before any lazy loading
require('lze').register_handlers(require('nixCatsUtils.lzUtils').for_cat)

-- We do requires for involved setups, do calls to lze there
require('pluginConf.bars')
require('pluginConf.completion')
require('pluginConf.snacks')
require('pluginConf.theme')
require('pluginConf.treesitter')

-- Plugin configs
require('lze').load {
  { import = 'pluginConf.aerial', },
  { import = 'pluginConf.conform', },
  { import = 'pluginConf.dap', },
  { import = 'pluginConf.fidget', },
  { import = 'pluginConf.git', },
  { import = 'pluginConf.lazydev', },
  { import = 'pluginConf.lint', },
  { import = 'pluginConf.markdown', },
  { import = 'pluginConf.mini', },
  { import = 'pluginConf.neotree', },
  { import = 'pluginConf.oil', },
  { import = 'pluginConf.pomodoro', },
  { import = 'pluginConf.trouble', },
  { import = 'pluginConf.util', },
  { import = 'pluginConf.vimtex', },
  { import = 'pluginConf.whichKey', },
}
