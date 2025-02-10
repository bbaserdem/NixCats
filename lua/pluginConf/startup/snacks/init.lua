-- <nixCats>/lua/pluginConf/startup/snacks/init.lua
-- Snacks configuration entry point

-- Configuring various snack components
require('snacks').setup({
  bigfile = { enabled = true, },
  bufdelete = { enabled = true, },
  dashboard = require('pluginConf.startup.snacks.dashboard'),
  dim = { enabled = true, },
  explorer = { enabled = true, },
  git = { enabled = true, },
  gitbrowse = { enabled = true, },
  image = { enabled = true, },
  indent = require('pluginConf.startup.snacks.indent'),
  input = { enabled = true, },
  layout = { enabled = true, },
  lazygit = { enabled = true, },
  notification = { enabled = true, },
  picker = { enabled = true, },
  scroll = { enabled = true, },
  terminal = { enabled = true, },
  toggle = { enabled = true, },
  win = { enabled = true, },
  zen = { enabled = true, },
})
