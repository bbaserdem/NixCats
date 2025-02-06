-- Nvim configuration entry

-- Global settings
require('luaConf.nvimOptions')
require('luaConf.nvimAutocmd')
require('luaConf.nvimKeybinds')

-- Register lze handler with the spec field 'for_cat' before any lazy loading
require('lze').register_handlers(require('nixCatsUtils.lzUtils').for_cat)

-- Apply colorscheme now
require('luaConf.nvimTheme')

-- LSP global configuration
require('luaConf.nvimLspGlobal')

-- Plugin configurations entry
require('pluginConf')
