-- <nixCats>/lua/pluginConf/ui/views/trouble.lua

return {
  "mini.map",
  for_cat = {
    cat = "ui.views",
    default = true,
  },
  require = { "mini.map" },
  event = { "DeferredUIEnter" },
  after = function(plugin)
    local map = require("mini.map")
    map.setup({
      integrations = {
        map.gen_integration.builtin_search(),
        map.gen_integration.diagnostic(),
        map.gen_integration.gitsigns(),
      },
    })
  end,
}
