-- <nixCats>/lua/pluginConf/snacks/init.lua
-- Snacks configuration entry point

-- Configuring various snack components
return {
  "snacks.nvim",
  for_cat = {
    cat = "functionality",
    default = true,
  },
  dep_of = {
    "neo-tree.nvim",
  },
  lazy = false,
  after = function(plugin)
    require("snacks").setup({
      -- Enabled plugins
      bigfile = { enabled = true },
      bufdelete = { enabled = true },
      dashboard = require("pluginConf.snacks.dashboard"),
      debug = require("pluginConf.snacks.debug"),
      dim = { enabled = true },
      gitbrowse = { enabled = true },
      image = { enabled = true },
      -- image = require("pluginConf.snacks.image"),
      indent = require("pluginConf.snacks.indent"),
      input = { enabled = true },
      layout = { enabled = true },
      lazygit = { enabled = true },
      notifier = require("pluginConf.snacks.notifier"),
      notify = { enabled = true },
      picker = require("pluginConf.snacks.picker"),
      profiler = { enabled = true },
      quickfile = { enabled = true },
      rename = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      terminal = { enabled = true },
      toggle = require("pluginConf.snacks.toggle"),
      util = { enabled = true },
      win = { enabled = true },
      zen = { enabled = true },
      -- Disabled plugins, if they are set disabled, they still get require calls
      --words = { enabled = false, },
      --explorer = { enabled = false, },
      --git = { enabled = false, },
      --image = { enabled = false, },
      --scope = { enabled = false, },
      --scratch = { enabled = false, },
      styles = require("pluginConf.snacks.styles"),
    })
  end,
}
