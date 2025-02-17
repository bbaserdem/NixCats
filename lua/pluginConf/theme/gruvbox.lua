-- <nixCats>/lua/pluginConf/theme/gruvbox.lua
-- Gruvbox for nvim

return {
  "gruvbox.nvim",
  for_cat = {
    cat = "theme",
    default = true,
  },
  in_extra = {
    key = "colorscheme.name",
    value = "gruvbox",
  },
  dep_of = {
    -- Make sure we are loaded before lualine; themeing issues
    "lualine.nvim",
  },
  colorscheme = {
    "gruvbox",
  },
  after = function(plugin)
    local _trans = false

    -- If nixCats, check to set defaults
    if require("nixCatsUtils").isNixCats then
      if nixCats.extra("colorscheme.name") == "gruvbox" then
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
    require("gruvbox").setup({
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = false,
      transparent_mode = _trans,
    })
  end,
}
