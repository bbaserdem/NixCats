-- <nixCats>/lua/pluginConf/system/init.lua
-- Lazy loaded plugins config

-- Plugin configs, with one call to lze
local M = {
  -- mini-base16, lze?
  {
    "plenary.nvim",
    for_cat = {
      cat = "system",
      default = true,
    },
    dep_of = {
      "yazi.nvim",
      "neo-tree.nvim",
    },
  },
  {
    "nui.nvim",
    for_cat = {
      cat = "system",
      default = true,
    },
    dep_of = {
      "neo-tree.nvim",
    },
  },
  {
    "nvim-nio",
    for_cat = {
      cat = "system",
      default = true,
    },
    dep_of = {
      "nvim-dap-ui",
    },
  },
}

return M
