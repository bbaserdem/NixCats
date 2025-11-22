-- <nixCats>/lua/pluginConf/tools/utility.lua
-- Utilities config

return {
  { -- Display url's in a picker view
    "urlview.nvim",
    for_cat = {
      cat = "tools.utility",
      default = true,
    },
    on_require = { "urlview" },
    cmd = { "UrlView" },
    after = function(plugin)
      require("urlview").setup({
        default_picker = "native",
        default_action = "system",
        default_register = "+",
        unique = true,
        sorted = false,
      })
    end,
  },
  { -- Delete buffers without closing windows
    "bufdelete.nvim",
    for_cat = {
      cat = "tools.utility",
      default = true,
    },
    on_require = { "bufdelete " },
    cmd = {
      "Bdelete",
      "Bwipeout",
    },
  },
  { -- Make directories for buffers
    "mkdir.nvim",
    for_cat = {
      cat = "tools.utility",
      default = true,
    },
    event = { "DeferredUIEnter" },
  },
}
