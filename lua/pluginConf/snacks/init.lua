-- <nixCats>/lua/pluginConf/snacks/init.lua
-- Snacks configuration entry point

-- Configuring various snack components
return {
  'snacks.nvim',
  event = { 'DeferredUIEnter', },
  after = function(plugin)
    require('snacks').setup({
      -- Enabled plugins
      --bigfile = { enabled = true, },
      bufdelete = { enabled = true, },
      dashboard = require('pluginConf.snacks.dashboard'),
      dim = { enabled = true, },
      gitbrowse = { enabled = true, },
      indent = require('pluginConf.snacks.indent'),
      input = { enabled = true, },
      layout = { enabled = true, },
      lazygit = { enabled = true, },
      notifier = require('pluginConf.snacks.notifier'),
      notify = { enabled = false, },
      rename = { enabled = true, },
      scroll = { enabled = true, },
      statuscolumn = { enabled = true, },
      terminal = { enabled = true, },
      toggle = { enabled = true, },
      util = { enabled = true, },
      win = { enabled = true, },
      zen = { enabled = true, },
      -- Disabled plugins, if they are set disabled, they still get require calls
      --words = { enabled = false, },
      --explorer = { enabled = false, },
      --git = { enabled = false, },
      --image = { enabled = false, },
      --picker = { enabled = false, },
      --profiler = { enabled = false, },
      --quickfile = { enabled = false, },
      --scope = { enabled = false, },
      --scratch = { enabled = false, },
    })
  end,
}
