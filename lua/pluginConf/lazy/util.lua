-- <nixCats>/lua/pluginConf/lazy/util.lua
-- Utility functions to be lazy loaded

return {
  { -- Library
    'plenary.nvim',
    for_cat = {
      cat = 'main',
      default = true,
    },
    dep_of = {
      'mkdnflow.nvim',
      'obsidian.nvim',
    },
    on_require = { 'plenary', },
  },
  { -- Make directories when saving
    'mkdir.nvim',
    for_cat = {
      cat = 'functionality',
      default = true,
    },
    event = { 'BufWritePre', },
  },
}
