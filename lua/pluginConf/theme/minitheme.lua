-- <nixCats>/lua/pluginConf/theme/minitheme.lua
-- Standalone mini theme for either stylix or minired

return {
  "mini.base16",
  in_extra = {
    key = "colorscheme.name",
    value = {
      "minired",
      "stylix",
    },
  },
  colorscheme = {
    "minired",
    "stylix",
  },
}
