-- <nixCats>/lua/pluginConf/lazy/util.lua
-- Utility functions to be lazy loaded

return {
  { -- Library
    'plenary.nvim',
    dep_of = {
      'mkdnflow.nvim',
    },
    on_require = { 'plenary', },
  },
  { -- Make directories when saving
    'mkdir.nvim',
    event = { 'BufWritePre', },
  },
}
