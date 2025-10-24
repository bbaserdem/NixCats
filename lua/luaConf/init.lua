-- Nvim configuration entry

-- Do our global settings
require("luaConf.myOptions")

-- Plugin configurations
require("pluginConf")

-- Apply colorscheme after plugins are registered with lze
require("luaConf.myColorscheme")

-- Autocommands
require("luaConf.myAutocmd")

-- Keybinds
require("keymapConf")

-- LSP global configuration
require("luaConf.myLspGlobal")
