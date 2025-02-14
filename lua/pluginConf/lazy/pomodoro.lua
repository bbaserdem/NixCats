-- <nixCats>/lua/pluginConf/lazy/pomodoro.lua
-- Pomodoro timer

-- Using snacks.notifier to do vim.notify notifications;
-- Default implementation does the following that's <compatible> with snacks
--   * Sets the opts.title_icon to <opts.icon>
--   * Prepends the notification message with opts.text_icon
--   * If opts.sticky is set, sends update notifications to refresh the message
--   * self.hide and self.show toggles
-- So snacks.notifier works as drop-in replacement

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
        { -- Default falls back to using vim.notify
          name = 'Default',
          opts = {
            sticky = true,
            title_icon = '󱎫 ',
            text_icon = '󰄉 ',
            style = 'fancy',      -- These are for snacks.notifier
            history = false,
          },
        },
        { -- Libnotify notifier
          name = 'System',
        },
      },
      -- Specific timer name overrides to notifiers
      timers = {
        -- This makes Break timers to only use the system notifier
        Break = { name = 'System', },
        ['Short Break'] = { name = 'System', },
        ['Long Break'] = { name = 'System', },
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
