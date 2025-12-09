-- <nixCats>/lua/pluginConf/ui/theme/melange.lua
-- Melange for nvim

return {
  "melange-nvim",
  for_cat = {
    cat = "ui.theme",
    default = true,
  },
  in_extra = {
    key = "colorscheme.name",
    value = "melange",
  },
  colorscheme = {
    "melange",
  },
  event = { "DeferredUIEnter" },
}
