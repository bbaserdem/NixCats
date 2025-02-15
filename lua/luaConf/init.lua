-- Nvim configuration entry

-- Do our global settings
require('luaConf.nvimOptions')

-- This lets paq-nvim manage plugins if not managed through nix
-- Do this before any plugin loading
require('luaConf.noNix')

-- Plugin configurations
require('pluginConf')

-- Apply colorscheme after plugins are registered with lze
local cs
if not require('nixCatsUtils').isNixCats then
  cs = 'catppuccin-gruvbox'
else
  cs = nixCats.extra('colorscheme')
  if (cs == '') or (cs == nil) or (not cs) then
    cs = 'default'
  end
end
vim.cmd.colorscheme(cs)

-- Do keybinds and autocommands
require('luaConf.nvimAutocmd')
require('luaConf.nvimKeybinds')

-- LSP global configuration
require('luaConf.nvimLspGlobal')
