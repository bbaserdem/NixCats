-- <nixCats>/lua/pluginConf/ui/theme/gruvboxMaterial.lua
-- Gruvbox material for nvim

return {
  "gruvbox-material.nvim",
  for_cat = {
    cat = "ui.theme",
    default = true,
  },
  in_extra = {
    key = "colorscheme.name",
    value = "gruvbox-material",
  },
  colorscheme = {
    "gruvbox-material",
  },
  after = function(plugin)
    local _trans = false
    if require("nixCatsUtils").isNixCats then
      if nixCats.extra("colorscheme.translucent") ~= nil then
        _trans = nixCats.extra("colorscheme.translucent")
      end
    end
    -- Load us only if we are the main theme
    require("gruvbox-material").setup({
      background = {
        transparent = _trans,
      },
    })
  end,
}
