-- <nixCats>/lua/pluginConf/ui/views/twilight.lua
-- Inactive code dimmer

return {
  "twilight.nvim",
  for_cat = {
    cat = "ui.views",
    default = true,
  },
  cmd = {
    "Twilight",
    "TwilightEnable",
    "TwilightDisable",
  },
  on_require = { "twilight" },
  after = function(plugin)
    require("twilight").setup({
      dimming = {
        alpha = 0.40,
        inactive = false,
      },
    })
  end,
}
