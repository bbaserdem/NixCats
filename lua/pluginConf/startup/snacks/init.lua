-- <nixCats>/lua/pluginConf/startup/snacks/init.lua
-- Snacks configuration entry point

-- Configuring various snack components
require('snacks').setup({
  bigfile = { enabled = true, },
  bufdelete = { enabled = true, },
  dashboard = require('pluginConf.startup.snacks.dashboard'),
  dim = { enabled = true, },
  explorer = { enabled = true, replace_netrw = false, },
  git = { enabled = true, },
  gitbrowse = { enabled = true, },
  image = { enabled = true, },
  indent = require('pluginConf.startup.snacks.indent'),
  input = { enabled = true, },
  layout = { enabled = true, },
  lazygit = { enabled = true, },
  notification = { enabled = true, },
  picker = require('pluginConf.startup.snacks.picker'),
  scroll = { enabled = true, },
  terminal = { enabled = true, },
  toggle = { enabled = true, },
  win = { enabled = true, },
  zen = { enabled = true, },
})
