-- <nixCats>/lua/pluginConf/ui/theme/kanagawa.lua
-- Kanagawa for nvim

return {
  "kanagawa.nvim",
  for_cat = {
    cat = "ui.theme",
    default = true,
  },
  in_extra = {
    key = "colorscheme.name",
    value = "kanagawa",
  },
  colorscheme = {
    "kanagawa-dragon",
    "kanagawa-lotus",
    "kanagawa-wave",
    "kanagawa",
  },
  event = { "DeferredUIEnter" },
  after = function(plugin)
    local _trans = false
    -- If nixCats, check to set the background hue

    if require("nixCatsUtils").isNixCats then
      if nixCats.extra("colorscheme.translucent") ~= nil then
        _trans = nixCats.extra("colorscheme.translucent")
      end
    end

    -- Load us
    require("kanagawa").setup({
      transparent = _trans,
    })
  end,
}
