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
    local _trans = false
    -- If nixCats, check to set the background hue

    if require("nixCatsUtils").isNixCats then
      if string.sub(nixCats.extra("colorscheme.name"), -3) == "fox" then
        -- Style doesn't work here
        if nixCats.extra("colorscheme.translucent") ~= nil then
          _trans = nixCats.extra("colorscheme.translucent")
        end
      end
    end
    -- Load us
    require("nightfox").setup({ options = {
      transparent = _trans,
    } })
  end,
}
