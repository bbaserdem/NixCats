-- <nixCats>/lua/pluginConf/lazy/bars/statusline.lua
-- Status line + winbar config

-- lualine nvim setup
return{
  'lualine.nvim',
  for_cat = {
    cat = 'status',
    default = true,
  },
  event = { 'DeferredUIEnter', },
  on_require = { 'lualine', },
  after = function(plugin)

    -- Trouble winbar component
    local troubleLine = require('trouble').statusline({
      mode = 'lsp_document_symbols',
      groups = {},
      title = false,
      filter = { range = true, },
      format = "{kind_icon}{symbol.name:Normal}",
      hl_group = 'lualine_y_normal',
    })
    -- Pomodoro timer for statusbar
    local pomoLine = function ()
      local ok, pomo = pcall(require, 'pomo')
      if not ok then
        return ''
      end
      local timer = pomo.get_first_to_finish()
      if timer == nil then
        return ''
      end
      return '󰄉 ' .. tostring(timer)
    end

    -- Statusbar config
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators =  { left = '', right = ''},
        section_separators =    { left = '', right = ''},
        always_divide_middle = true,
        globalstatus = true,
      },
      -- The configuration
      tabline = {},
      winbar = {
        lualine_a = {},
        lualine_b = {
          { troubleLine.get,
            cond = troubleLine.has,
          },
        },
        lualine_x = {},
        lualine_y = {
          {
            'filename',
            file_status = true,
            newfile_status = true,
            path = 1,
            shorting_target = 40,
            symbols = {
              modified = ' ',
              readonly = ' ',
              unnamed = ' ',
              newfile = ' ',
            },
          },
        },
        lualine_z = {
          {
            'filetype',
            icon_only = true,
            colored = false,
          },
        },
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          {
            'filename',
            file_status = true,
            newfile_status = true,
            path = 1,
            shorting_target = 40,
            symbols = {
              modified = ' ',
              readonly = ' ',
              unnamed = ' ',
              newfile = ' ',
            },
          }, {
            'filetype',
            icon_only = true,
            colored = true,
          },
        },
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {
          'branch',
          'diff',
          'filetype',
        },
        lualine_c = {
          {
            'buffers',
            max_length = vim.o.columns * 2 / 3,
            filetype_names = {
              TelescopePrompt = '󰍉 ',
              dashboard = '󰨝 ',
            },
          },
        },
        lualine_x = {
          'selectioncount',
          'searchcount',
        },
        lualine_y = {
          'progress',
        },
        lualine_z = {
          'location',
          pomoLine,
        }
      },
    })
  end,
}
