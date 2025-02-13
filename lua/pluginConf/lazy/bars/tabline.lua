-- <nixCats>/lua/pluginConf/lazy/bars/tabline.lua
-- Tabline config

-- Theme for the tabby config
local theme = {
  fill = 'TabLineFill',       -- tabline background
  head = 'TabLine',           -- head element highlight
  current_tab = 'TabLineSel', -- current tab label highlight
  tab = 'TabLine',            -- other tab label highlight
  win = 'TabLine',            -- window highlight
  tail = 'TabLine',           -- tail element highlight
}

-- Loading tables, and letting handlers deal with categories
return {
  {
    'tabby.nvim',
    for_cat = {
      cat = 'status',
      default = true,
    },
    event = { 'DeferredUIEnter', },
    cmd = { 'Tabby', },
    after = function(plugin)
      require('tabby.tabline').set(function(line)
        return {
          {
            {
              (require('nixCatsUtils').isNixCats and '󱄅  ' or ' '),
              hl = theme.head
            },
            line.sep('', theme.head, theme.fill),
          },
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab

            -- remove count of wins in tab with [n+] included in tab.name()
            local name = tab.name()
            local index = string.find(name, "%[%d")
            local tab_name = index and string.sub(name, 1, index - 1) or name

            -- indicate if any of the buffers in tabe have unsaved changes
            local modified = false
            local win_ids = require('tabby.module.api').get_tab_wins(tab.id)
            for _, win_id in ipairs(win_ids) do
              if pcall(vim.api.nvim_win_get_buf, win_id) then
                local bufid = vim.api.nvim_win_get_buf(win_id)
                if vim.api.nvim_buf_get_option(bufid, "modified") then
                  modified = true
                  break
                end
              end
            end

            return {
              line.sep('', hl, theme.fill),
              tab.is_current() and ' ' or ' ',
              tab.number(),
              tab_name,
              modified and ' ',
              -- tab.close_btn(''),
              line.sep('', hl, theme.fill),
              hl = hl,
              margin = ' ',
            }
          end),
          line.spacer(),
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
  },
}
