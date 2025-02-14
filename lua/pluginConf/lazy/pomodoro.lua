-- <nixCats>/lua/pluginConf/lazy/pomodoro.lua
-- Pomodoro timer

return {
  'pomo.nvim',
  for_cat = {
    cat = 'functionality',
    default = true,
  },
  cmd = {
    'TimerStart',
    'TimerRepeat',
    'TimerSession',
  },
  after = function(plugin)
    require('pomo').setup({
      notifiers = {
        --[[
        { -- nvim.notify notifier
          name = 'Default',
          opts = {
            sticky = true,    -- Timer stays on screen
            title_icon = '󱎫 ',
            text_icon = '󰄉 ',
          },
        }, --]]
        { -- Libnotify notifier
          name = 'System',
        },
      },
      -- Specific timer name overrides to notifiers
      timers = {
        -- This makes Break timer to only use the system notifier
        Break = { name = 'System', },
      },
      -- Custom timer sessions
      sessions = {
        pomodoro = {
          { name = 'Work',        duration = '25m', },
          { name = 'Short Break', duration =  '5m', },
          { name = 'Work',        duration = '25m', },
          { name = 'Short Break', duration =  '5m', },
          { name = 'Work',        duration = '25m', },
          { name = 'Long Break',  duration = '15m', },
        },
      },

    })
  end,
}
