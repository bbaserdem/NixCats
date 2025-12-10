-- <nixCats>/lua/pluginConf/ui/theme/cyberdream.lua
-- Cyberdream for nvim

return {
  "cyberdream.nvim",
  for_cat = {
    cat = "ui.theme",
    default = true,
  },
  in_extra = {
    key = "colorscheme.name",
    value = "cyberdream",
  },
  colorscheme = {
    "cyberdream",
  },
  event = { "DeferredUIEnter" },
  after = function(plugin)
    -- Load us
    require("cyberdream").setup({
      variant = "auto",
      transparent = true,
    })
  end,
}
