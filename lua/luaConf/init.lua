-- Nvim configuration entry

-- Settings
require('luaConf.nvimOptions')

-- Plugin configurations
require('pluginConf')

-- Apply colorscheme
local cs
if not require('nixCatsUtils').isNixCats then
  cs = 'catppuccin-gruvbox'
else
  cs = nixCats.extra('colorscheme')
end
vim.cmd.colorscheme(cs)

-- Keybinds and autocmds
require('luaConf.nvimAutocmd')
require('luaConf.nvimKeybinds')

-- LSP global configuration
require('luaConf.nvimLspGlobal')
