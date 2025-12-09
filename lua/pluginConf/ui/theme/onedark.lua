-- <nixCats>/lua/pluginConf/ui/theme/onedark.lua
-- onedark for nvim

return {
  "onedark.nvim",
  for_cat = {
    cat = "ui.theme",
    default = true,
  },
  in_extra = {
    key = "colorscheme.name",
    value = "onedark",
  },
  colorscheme = {
    "onedark",
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
    require("onedark").setup({
      transparent = _trans,
    })
  end,
}
