-- <nixCats>/lua/pluginConf/ui/theme/melange.lua
-- Melange for nvim

return {
  "melange-nvim",
  for_cat = {
    cat = "ui.theme",
    default = true,
  },
  in_extra = {
    key = "colorscheme.name",
    value = "melange",
  },
  colorscheme = {
    "melange",
  },
  event = { "DeferredUIEnter" },
  after = function(plugin)
    -- Set background
    if require("nixCatsUtils").isNixCats then
      if nixCats.extra("colorscheme.name") == "melange" then
        if nixCats.extra("colorscheme.style") == "light" then
          vim.o.background = "light"
        else
          vim.o.background = "dark"
        end
      end
    end
  end,
}
