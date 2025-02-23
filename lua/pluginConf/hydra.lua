-- <nixCats>/lua/pluginConf/hydra.lua
-- Hydra config

return {
  "hydra.nvim",
  for_cat = {
    cat = "functionality",
    default = true,
  },
  on_require = { "hydra" },
  dep_of = {
    "gitsigns.nvim",
  },
}
