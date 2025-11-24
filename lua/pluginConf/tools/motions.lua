-- <nixCats>/lua/pluginConf/tools/movement.lua
-- Movement tools config
return {
  { -- Git status signs in the num column
    "mini.ai",
    for_cat = {
      cat = "tools.movement",
      default = true,
    },
    event = { "DeferredUIEnter" },
    after = function(plugin)
      -- Need to activate all the individual plugins separately
      require("mini.ai").setup()
    end,
  },
  { -- Git status signs in the num column
    "mini.align",
    for_cat = {
      cat = "tools.movement",
      default = true,
    },
    event = { "DeferredUIEnter" },
    after = function(plugin)
      -- Need to activate all the individual plugins separately
      require("mini.align").setup()
    end,
  },
  { -- Git status signs in the num column
    "mini.comment",
    for_cat = {
      cat = "tools.movement",
      default = true,
    },
    event = { "DeferredUIEnter" },
    after = function(plugin)
      -- Need to activate all the individual plugins separately
      require("mini.comment").setup()
    end,
  },
  { -- Git status signs in the num column
    "mini.move",
    for_cat = {
      cat = "tools.movement",
      default = true,
    },
    event = { "DeferredUIEnter" },
    after = function(plugin)
      -- Need to activate all the individual plugins separately
      require("mini.move").setup()
    end,
  },
  { -- Git status signs in the num column
    "mini.pairs",
    for_cat = {
      cat = "tools.movement",
      default = true,
    },
    event = { "DeferredUIEnter" },
    after = function(plugin)
      -- Need to activate all the individual plugins separately
      require("mini.pairs").setup()
    end,
  },
  { -- Git status signs in the num column
    "mini.splitjoin",
    for_cat = {
      cat = "tools.movement",
      default = true,
    },
    event = { "DeferredUIEnter" },
    after = function(plugin)
      -- Need to activate all the individual plugins separately
      require("mini.splitjoin").setup()
    end,
  },
  { -- Git status signs in the num column
    "mini.surround",
    for_cat = {
      cat = "tools.movement",
      default = true,
    },
    event = { "DeferredUIEnter" },
    after = function(plugin)
      -- Need to activate all the individual plugins separately
      require("mini.surround").setup()
    end,
  },
}
