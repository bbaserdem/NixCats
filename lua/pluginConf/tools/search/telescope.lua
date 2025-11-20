-- <nixCats>/lua/pluginConf/tools/search/telescope.lua
-- Telescope; picker

return {
  {
    "telescope.nvim",
    for_cat = {
      cat = "tools.search",
      default = true,
    },
    after = function(plugin)
      require("telescope").setup({
        extensions = {},
      })
    end,
  },
}
