-- <nixCats>/lua/pluginConf/startup/snacks/init.lua
-- Snacks configuration entry point

-- Configuring various snack components
require('snacks').setup({
  -- Enabled plugins
  bigfile = { enabled = true, },
  bufdelete = { enabled = true, },
  dashboard = require('pluginConf.startup.snacks.dashboard'),
  dim = { enabled = true, },
  gitbrowse = { enabled = true, },
  indent = require('pluginConf.startup.snacks.indent'),
  input = { enabled = true, },
  layout = { enabled = true, },
  lazygit = { enabled = true, },
  notifier = require('pluginConf.startup.snacks.notifier'),
  notify = { enabled = false, },
  rename = { enabled = true, },
  scroll = { enabled = true, },
  statuscolumn = { enabled = true, },
  terminal = { enabled = true, },
  toggle = { enabled = true, },
  util = { enabled = true, },
  win = { enabled = true, },
  zen = { enabled = true, },
  -- Disabled plugins
  words = { enabled = false, },
  explorer = { enabled = false, },
  git = { enabled = false, },
  image = { enabled = false, },
  picker = { enabled = false, },
  profiler = { enabled = false, },
  quickfile = { enabled = false, },
  scope = { enabled = false, },
  scratch = { enabled = false, },
})
