-- <nixCats>/lua/pluginConf/theme/tabline.lua
-- Tabline config

-- Theme for the tabby config
local theme = {
  nix = 'TabIconNix',
  nvim = 'TabIconNvim',
  fill = 'TabLineFill',       -- tabline background
  head = 'TabLine',           -- head element highlight
  current_tab = 'TabLineSel', -- current tab label highlight
  tab = 'TabLine',            -- other tab label highlight
  win = 'TabLine',            -- window highlight
  tail = 'TabLine',           -- tail element highlight
}

-- Loading tables, and letting handlers deal with categories
return {
  'tabby.nvim',
  for_cat = {
    cat = 'theme',
    default = true,
  },
  event = { 'DeferredUIEnter', },
  cmd = { 'Tabby', },
  after = function(plugin)
    require('tabby.tabline').set(function(line)
      return {
        -- Icon menu
        {
          {
            (require('nixCatsUtils').isNixCats and '󱄅  ' or ''),
            hl = theme.nix,
          },
          {
            ' ',
            hl = theme.nvim
          },
          line.sep('', theme.head, theme.fill),
        },
        -- List of tabs, main left side
        line.tabs().foreach(function(tab)
          local this_hl = tab.is_current() and theme.current_tab or theme.tab

          -- indicate if any of the buffers in tab have unsaved changes
          local modified = false
          local win_ids = require('tabby.module.api').get_tab_wins(tab.id)
          for _, win_id in ipairs(win_ids) do
            if pcall(vim.api.nvim_win_get_buf, win_id) then
              local bufid = vim.api.nvim_win_get_buf(win_id)
              if vim.api.nvim_get_option_value('modified', {buf = bufid}) then
                modified = true
                break
              end
            end
          end
          return {
            line.sep('', this_hl, theme.fill),
            tab.is_current() and ' ' or ' ',
            tab.number(),
            tab.name(),
            modified and ' ',
            -- tab.close_btn(''),
            line.sep('', this_hl, theme.fill),
            hl = this_hl,
            margin = ' ',
          }
        end),
        line.spacer(),

        -- List of open windows
        line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
          return {
            line.sep('', theme.win, theme.fill),
            win.is_current() and ' ' or ' ',
            win.buf_name(),
            line.sep('', theme.win, theme.fill),
            hl = theme.win,
            margin = ' ',
          }
        end),
        {
          line.sep('', theme.tail, theme.fill),
          { '  ', hl = theme.tail },
        },
        hl = theme.fill,
      }
    end)
  end,
}
