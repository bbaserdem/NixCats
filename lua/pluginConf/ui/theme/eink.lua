-- <nixCats>/lua/pluginConf/ui/theme/eink.lua
-- E-ink grayscale theme for nvim

return {
  "e-ink.nvim",
  for_cat = {
    cat = "ui.theme",
    default = true,
  },
  in_extra = {
    key = "colorscheme.name",
    value = "e-ink",
  },
  colorscheme = {
    "e-ink",
  },
  after = function(plugin)
    -- Load us
    require("e-ink").setup()
  end,
}
