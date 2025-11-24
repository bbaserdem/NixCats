-- <nixCats>/lua/pluginConf/ui/views/trouble.lua

return {
  "mini.map",
  for_cat = {
    cat = "ui.views",
    default = true,
  },
  require = { "mini.map" },
  cmd = { "MiniMap" },
  -- We want deferreduienter to modify the gutter icons
  after = function(plugin)
    require("mini.map").setup({})
  end,
}
