-- <nixCats>/lua/pluginConf/trouble.lua

return {
  "trouble.nvim",
  for_cat = {
    cat = "status",
    default = true,
  },
  dep_of = {
    "lualine.nvim",
  },
  cmd = { "Trouble" },
  -- We want deferreduienter to modify the gutter icons
  event = { "DeferredUIEnter" },
  after = function(plugin)
    require("trouble").setup({
      icons = {
        top = "║ ",
        middle = "╟─",
        last = "╙─",
        fold_open = " ",
        fold_closed = " ",
        ws = "  ",
      },
      picker = {
        actions = require("trouble.sources.snacks").actions,
        win = {
          input = {
            keys = {
              ["<c-t>"] = {
                "trouble_open",
                mode = { "n", "i" },
              },
            },
          },
        },
      },
    })
  end,
}
