-- <nixCats>/lua/pluginConf/startup/snacks/notifier.lua
-- Notification daemon 

return {
  enabled = true,
  timeout = 4000,
  icons = {
    error = " ",
    warn =  " ",
    info =  " ",
    debug = " ",
    trace = " ",
  },
  keep = function(notif)
    -- Keep notifications on screen if in commandline
    return vim.fn.getcmdpos() > 0
  end,
  style = 'compact',
  top_down = true,
  date_format = '%R',
  more_format = ' ↓ %d lines ',
}
