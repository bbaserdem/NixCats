-- <nixCats>/lua/nixlessConf/init.lua
-- Configuring nvim to run without nixCats

-- Ask paq to download our plugins
require('nixlessConf.plugList')

-- Register plugins with lze
require("lze").load {
  import = { "pluginConf/mason", },
}
