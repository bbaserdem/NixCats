-- Colorscheme setter, this one is a bit convoluted

-- Get colorscheme from nixcats, or default
local colorschemeName = nixCats('theme')
if not require('nixCatsUtils').isNixCats then
  colorschemeName = 'gruvbox-material'
end

-- If this theme has catppuccin override, apply it
if colorschemeName == 'gruvbox-material' then
  local _opt = require('luaConf.colorScheme.catppuccinGruvbox')
  require('catppuccin').setup(_opt)
  colorschemeName = 'catppuccin'
end

-- Set our colorscheme
vim.cmd.colorscheme(colorschemeName)
