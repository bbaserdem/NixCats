-- <nixCats>/lua/pluginConf/ui/views/indent-blankline.lua

return {
  "indent-blankline.nvim",
  for_cat = {
    cat = "ui.views",
    default = true,
  },
  event = { "DeferredUIEnter" },
  after = function(plugin)
    local highlight = {
      "RainbowDelimiterRed",
      "RainbowDelimiterYellow",
      "RainbowDelimiterBlue",
      "RainbowDelimiterOrange",
      "RainbowDelimiterGreen",
      "RainbowDelimiterViolet",
      "RainbowDelimiterCyan",
    }

    require("ibl").setup({
      scope = {
        highlight = highlight,
      },
    })

    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}
