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
      "telescope.nvim",
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
      "telescope.nvim",
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
  {
    "mini.base16",
    for_cat = {
      cat = "system",
      default = true,
    },
    colorscheme = { "minicyan", "minischeme", "minicrimson" },
    after = function(plugin)
      require("mini.base16").setup({})
    end,
  },
}

return M
