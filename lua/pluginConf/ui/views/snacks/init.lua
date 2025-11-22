-- <nixCats>/lua/pluginConf/ui/views/snacks/init.lua
-- Snacks configuration for some ui elements

return {
  "snacks.nvim",
  for_cat = {
    cat = "ui.views",
    default = true,
  },
  lazy = false,
  after = function(plugin)
    require("snacks").setup({
      -- Enabled plugins
      dashboard = require("pluginConf.ui.views.snacks.dashboard"),
      gh = { enabled = true },
      indent = require("pluginConf.ui.views.snacks.indent"),
      input = { enabled = true },
      notifier = require("pluginConf.ui.views.snacks.notifier"),
      scroll = { enabled = true },
      toggle = require("pluginConf.ui.views.snacks.toggle"),
      -- Disabled plugins
      bigfile = { enabled = false },
      bufdelete = { enabled = false },
      debug = { enabled = false },
      dim = { enabled = false },
      gitbrowse = { enabled = false },
      image = { enabled = false },
      keymap = { enabled = false },
      layout = { enabled = false },
      lazygit = { enabled = false },
      picker = { enabled = false },
      profiler = { enabled = false },
      quickfile = { enabled = false },
      rename = { enabled = false },
      scratch = { enabled = false },
      statuscolumn = { enabled = false },
      terminal = { enabled = false },
      win = { enabled = false },
      words = { enabled = false },
      zen = { enabled = false },
      -- Disabled plugins, if they are set disabled, they still get require calls
    })
  end,
}
