-- <nixCats>/lua/pluginConf/ui/views/highlight-colors.lua

return {
  "nvim-highlight-colors",
  for_cat = {
    cat = "ui.views",
    default = true,
  },
  dep_of = { "nvim-cmp" },
  cmd = {
  function
  },
  event = { "DeferredUIEnter" },
  after = function(plugin)
    require("nvim-highlight-colors").setup({
    })
  end,
}
