-- <nixCats>/lua/pluginConf/theme/eink.lua
-- E-ink grayscale theme for nvim

return {
  "e-ink.nvim",
  for_cat = {
    cat = "theme",
    default = true,
  },
  in_extra = {
    key = "colorscheme.name",
    value = "e-ink",
  },
  colorscheme = {
    "e-ink",
  },
  event = { "DeferredUIEnter" },
  after = function(plugin)
    if require("nixCatsUtils").isNixCats then
      if nixCats.extra("colorscheme.name") == "e-ink" then
        if nixCats.extra("colorscheme.style") == "light" then
          vim.o.background = "light"
        else
          vim.o.background = "dark"
        end
      end
    end

    -- Load us
    require("e-ink").setup()
  end,
}
