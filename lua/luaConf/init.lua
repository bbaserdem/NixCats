-- Nvim configuration entry

-- Global settings
require('luaConf.nvimOptions')
require('luaConf.nvimAutocmd')
require('luaConf.nvimKeybinds')

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

-- LSP global configuration
require('luaConf.nvimLspGlobal')
