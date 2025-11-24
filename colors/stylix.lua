-- colors/stylix.lua
-- Stylix integration with nixCats

-- Default to paraiso theme
local _theme = {
  base00 = "#2f1e2e", -- ----
  base01 = "#41323f", -- ---
  base02 = "#4f424c", -- --
  base03 = "#776e71", -- -
  base04 = "#8d8687", -- +
  base05 = "#a39e9b", -- ++
  base06 = "#b9b6b0", -- +++
  base07 = "#e7e9db", -- ++++
  base08 = "#ef6155", -- red
  base09 = "#f99b15", -- orange
  base0A = "#fec418", -- yellow
  base0B = "#48b685", -- green
  base0C = "#5bc4bf", -- aqua
  base0D = "#06b6ef", -- blue
  base0E = "#815ba4", -- purple
  base0F = "#e96ba8", -- brown
}
local _trans = false

-- The stylix base16 array should be provided in the extra.colorscheme.base16 array
if require("nixCatsUtils").isNixCats then
  if nixCats.extra("colorscheme.base16") ~= nil then
    _theme = nixCats.extra("colorscheme.base16")
  end
  if nixCats.extra("colorscheme.translucent") ~= nil then
    _trans = nixCats.extra("colorscheme.translucent")
  end
end

-- Load the colorscheme
require("mini.base16").setup({
  palette = _theme,
  plugins = {
    default = true,
  },
})
