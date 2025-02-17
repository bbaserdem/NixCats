-- Nvim configuration entry

-- Do our global settings
require("luaConf.myOptions")

-- This lets set up things for non-nix usage
require("nixlessConf")

-- Plugin configurations
require("pluginConf")

-- Apply colorscheme after plugins are registered with lze
require("luaConf.myColorscheme")

-- Do keybinds and autocommands
require("luaConf.myAutocmd")
require("keymapConf")

-- LSP global configuration
require("luaConf.myLspGlobal")
