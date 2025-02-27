-- <nixCats>/lua/pluginConf/theme/cyberdream.lua
-- Cyberdream for nvim

return {
  "cyberdream.nvim",
  for_cat = {
    cat = "theme",
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
    local _trans = true

    if require("nixCatsUtils").isNixCats then
      if nixCats.extra("colorscheme.name") == "cyberdream" then
        if nixCats.extra("colorscheme.style") == "light" then
          vim.o.background = "light"
        else
          vim.o.background = "dark"
        end
        if nixCats.extra("colorscheme.translucent") ~= nil then
          _trans = nixCats.extra("colorscheme.translucent")
        end
      end
    end

    -- Load us
    require("cyberdream").setup({
      variant = "auto",
      transparent = _trans,
    })
  end,
}
