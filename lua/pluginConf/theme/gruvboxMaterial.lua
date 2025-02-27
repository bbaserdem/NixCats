-- <nixCats>/lua/pluginConf/theme/gruvboxMaterial.lua
-- Gruvbox material for nvim

return {
  "gruvbox-material.nvim",
  for_cat = {
    cat = "theme",
    default = true,
  },
  in_extra = {
    key = "colorscheme.name",
    value = "gruvbox-material",
  },
  colorscheme = {
    "gruvbox-material",
  },
  event = { "DeferredUIEnter" },
  after = function(plugin)
    local _trans = false
    if require("nixCatsUtils").isNixCats then
      if nixCats.extra("colorscheme.name") == "gruvbox-material" then
        if nixCats.extra("colorscheme.style") == "light" then
          vim.o.background = "light"
        else
          vim.o.background = "dark"
        end
        if nixCats.extra("colorscheme.translucent") ~= nil then
          _trans = nixCats.extra("colorscheme.translucent")
        end
        -- Load us only if we are the main theme
        require("gruvbox-material").setup({
          background = {
            transparent = _trans,
          },
        })
      end
    end
  end,
}
