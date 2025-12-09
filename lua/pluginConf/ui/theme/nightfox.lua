-- <nixCats>/lua/pluginConf/ui/theme/nightfox.lua
-- Nightfox for nvim

return {
  "nightfox.nvim",
  for_cat = {
    cat = "ui.theme",
    default = true,
  },
  in_extra = {
    key = "colorscheme.name",
    value = "nightfox",
  },
  colorscheme = {
    "carbonfox",
    "dawnfox",
    "dayfox",
    "duskfox",
    "nightfox",
    "nordfox",
    "terafox",
  },
  event = { "DeferredUIEnter" },
  after = function(plugin)
    -- If nixCats, check to set the background hue
    local _trans = false
    if require("nixCatsUtils").isNixCats then
      if nixCats.extra("colorscheme.translucent") ~= nil then
        _trans = nixCats.extra("colorscheme.translucent")
      end
    end
    -- Load us
    require("nightfox").setup({
      options = {
        transparent = _trans,
      },
    })
  end,
}
