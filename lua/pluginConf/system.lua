-- <nixCats>/lua/pluginConf/system/init.lua
-- Lazy loaded plugins config

-- Plugin configs, with one call to lze
local M = {
  -- mini-base16, lze?
  {
    "plenary.nvim",
    dep_of = {
      "neo-tree.nvim",
    },
  },
  {
    "nui.nvim",
    dep_of = {
      "neo-tree.nvim",
    },
  },
}

return M
