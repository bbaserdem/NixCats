-- <nixCats>/lua/pluginConf/startup/snacks/dashboard.lua
-- Dashboard config

-- Configuring dashboard
return {
  enabled = true,
  -- We don't want lazy as a function
  keys = {
    { icon = " ", key = "f", desc = "Find File",
      action = ":lua Snacks.dashboard.pick('files')" },
    { icon = " ", key = "n", desc = "New File",
      action = ":ene | startinsert" },
    { icon = " ", key = "g", desc = "Find Text",
      action = ":lua Snacks.dashboard.pick('live_grep')" },
    { icon = " ", key = "r", desc = "Recent Files",
      action = ":lua Snacks.dashboard.pick('oldfiles')" },
    { icon = " ", key = "c", desc = "Config",
      action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
    { icon = " ", key = "s", desc = "Restore Session",
      section = "session" },
    { icon = " ", key = "q", desc = "Quit",
      action = ":qa" },
  },
  -- Using the advanced template
  sections = {
    { section = "header" },
    {
      pane = 2,
      section = "terminal",
      -- cmd = "colorscript -e square",
      -- Command provided by dw1-shell-color-scripts
      cmd = "colorscript -e dna",
      height = 5,
      padding = 1,
    },
    { section = "keys", gap = 1, padding = 1 },
    { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
    { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
    {
      pane = 2,
      icon = " ",
      title = "Git Status",
      section = "terminal",
      enabled = function()
        return Snacks.git.get_root() ~= nil
      end,
      cmd = "git status --short --branch --renames",
      height = 5,
      padding = 1,
      ttl = 5 * 60,
      indent = 3,
    },
    { section = "startup" },
  },

}
