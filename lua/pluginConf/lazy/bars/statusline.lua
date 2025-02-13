-- <nixCats>/lua/pluginConf/lazy/bars/statusline.lua
-- Status line config

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
    -- Trouble config
    local symbols = require('trouble').statusline({
      mode = 'lsp_document_symbols',
      title = false,
      hl_group = 'lualine_x_normal',
    })

    require('lualine').setup({
      extensions = {
        'aerial',
        'fugitive',
        'neo-tree',
        'nvim-dap-ui',
        'oil',
        'trouble',
      },
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
      inactive_winbar = {},
      winbar = {},
      inactive_sections = {},
      sections = {
        lualine_a = {'mode'},
        lualine_b = {
          'filetype',
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
        lualine_c = {
          {
            'buffers',
            max_length = vim.o.columns * 1 / 2,
            filetype_names = {
              TelescopePrompt = '󰍉 ',
              dashboard = '󰨝 ',
            },
          },
        },
        lualine_x = {
          'aerial',
          'branch',
          'diff',
        },
        lualine_y = {
          'selectioncount',
          'searchcount',
          --[[
          {
            symbols.get,
            cond = symbols.has,
          },
          --]]
        },
        lualine_z = {
          'progress',
          'location',
        }
      },
    })
  end,
}
