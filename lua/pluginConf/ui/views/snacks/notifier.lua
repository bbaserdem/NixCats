-- <nixCats>/lua/pluginConf/snacks/notifier.lua
-- Notification daemon

return {
  enabled = true,
  margin = {
    top = 1,
    right = 1,
    bottom = 1,
  },
  icons = {
    error = " ",
    warn = " ",
    info = " ",
    debug = " ",
    trace = " ",
  },
  keep = false,
  style = "fancy",
  top_down = true,
  date_format = "%R",
  more_format = " ↓ %d lines ",
}
