-- <nixCats>/lua/pluginConf/startup/snacks/init.lua
-- Snacks configuration entry point

-- Configuring various snack components
require('snacks').setup({
  bigfile = { enabled = true, },
  bufdelete = { enabled = true, },
  dashboard = require('pluginConf.startup.snacks.dashboard'),
})
