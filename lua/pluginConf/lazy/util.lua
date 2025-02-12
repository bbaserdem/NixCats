-- <nixCats>/lua/pluginConf/lazy/util.lua
-- Utility functions to be lazy loaded

return {
  { -- Preview
    'plenary.nvim',
    dep_of = {
      'mkdnflow.nvim',
    },
    on_require = { 'plenary', },
  },
}
