-- Nvim configuration entry

-- Global settings
require('luaConf.nvimOptions')
require('luaConf.nvimAutocmd')
require('luaConf.nvimKeybinds')

-- Register lze handler with the spec field 'for_cat'
require('lze').register_handlers(require('nixCatsUtils.lzUtils').for_cat)

-- Apply colorscheme now
require('luaConf.colorScheme')

-- Plugin configurations
require('luaConf.pluginConfigs')

-- LSP configurations
require('luaConf.lspConfigs')
