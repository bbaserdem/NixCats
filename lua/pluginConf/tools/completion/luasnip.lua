-- <nixCats>/lua/pluginConf/tools/completion/luasnip.lua
-- Luasnip config

-- Loading tables, and letting handlers deal with categories
return {
  {
    "friendly-snippets",
    for_cat = {
      "tools.completion",
      default = true,
    },
    dep_of = {
      "nvim-cmp",
    },
  },
  {
    "luasnip",
    for_cat = {
      "tools.completion",
      default = true,
    },
    dep_of = {
      "nvim-cmp",
    },
    after = function(plugin)
      local luasnip = require("luasnip")

      -- Needed for friendly snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "../../../../snippets" } })
      luasnip.config.setup({})
    end,
  },
}
