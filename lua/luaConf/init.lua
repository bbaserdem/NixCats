-- Nvim configuration entry

-- Do our global settings
require('luaConf.nvimOptions')

-- This lets paq-nvim manage plugins if not managed through nix
-- Do this before any plugin loading
require('luaConf.noNix')

-- Plugin configurations
require('pluginConf')

-- Apply colorscheme after plugins are registered with lze
require('luaConf.nvimColorscheme')

-- Do keybinds and autocommands
require('luaConf.nvimAutocmd')
require('luaConf.nvimKeybinds')

-- LSP global configuration
require('luaConf.nvimLspGlobal')
