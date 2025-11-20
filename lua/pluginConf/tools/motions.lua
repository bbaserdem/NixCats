-- <nixCats>/lua/pluginConf/tools/movement.lua
-- Movement tools config

return {
  { -- Git status signs in the num column
    "mini.nvim",
    for_cat = {
      cat = "tools.movement",
      default = true,
    },
    event = { "DeferredUIEnter" },
    after = function(plugin)
      -- Need to activate all the individual plugins separately
      require("mini.ai").setup()
      require("mini.align").setup()
      require("mini.comment").setup()
      require("mini.move").setup()
      require("mini.pairs").setup()
      require("mini.splitjoin").setup()
      require("mini.surround").setup()
    end,
  },
}
