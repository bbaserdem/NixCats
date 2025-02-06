-- Theme-ing related settings
local M = {}

-- Get colorscheme from nixcats, or default
local colorschemeName = nixCats.extra('colorscheme')
if not require('nixCatsUtils').isNixCats then
  colorschemeName = 'gruvbox-material'
end

-- If this theme has catppuccin override, apply it
if colorschemeName == 'gruvbox-material' then
  local _opt = require('pluginConf.catppuccinOverrides.gruvbox')
  require('catppuccin').setup(_opt)
  colorschemeName = 'catppuccin'
end

-- Set our colorscheme
vim.cmd.colorscheme(colorschemeName)

-- Load the lspkind plugin to add pictograms, no lazy loading this plugin
local _status, _plug = pcall(require, 'lspkind')
if _status then
    _plug.init({
        mode = 'symbol_text',
        preset = 'default',
    })
end
