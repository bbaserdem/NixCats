-- <nixCats>/lua/pluginConf/flash.lua
-- Flash config

return {
  "flash.nvim",
  for_cat = {
    cat = "functionality",
    default = true,
  },
  on_require = { "flash" },
  after = function(plugin)
    require("flash").setup({
      labels = "aoeeuidhtnpyfgcrlqjkxbmwvz",
    })
  end,
}
