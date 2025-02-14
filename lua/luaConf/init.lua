-- Nvim configuration entry

-- Settings
require('luaConf.nvimOptions')

-- Plugin configurations
require('pluginConf')

-- Apply colorscheme here, lazy loading hook is at colorscheme
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

-- Keybinds and autocmds
require('luaConf.nvimAutocmd')
require('luaConf.nvimKeybinds')

-- LSP global configuration
require('luaConf.nvimLspGlobal')
