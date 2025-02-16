-- Nvim configuration entry

-- Do our global settings
require('luaConf.nvimOptions')

-- This lets set up things for non-nix usage
require('nixlessConf')

-- Plugin configurations
require('pluginConf')

-- Apply colorscheme after plugins are registered with lze
require('luaConf.nvimColorscheme')

-- Do keybinds and autocommands
require('luaConf.nvimAutocmd')
require('keymapConf')

-- LSP global configuration
require('luaConf.nvimLspGlobal')
