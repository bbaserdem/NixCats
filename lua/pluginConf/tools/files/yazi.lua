-- <nixCats>/lua/pluginConf/tools/files/yazi.lua
-- Yazi: File browser integration

return {
  {
    "yazi.nvim",
    for_cat = {
      cat = "tools.files",
      default = true,
    },
    cmd = "Yazi",
    after = function(plugin)
      require("yazi").setup({
        open_for_directories = false,
      })
    end,
  },
}
