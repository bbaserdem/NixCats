-- <nixCats>/lua/pluginConf/lazy/bars/bufferline.lua
-- Bufferline config

-- Incline nvim setup
return{
  'incline.nvim',
  for_cat = {
    cat = 'status',
    default = true,
  },
  event = { 'DeferredUIEnter', },
  on_require = { 'incline', },
  after = function(plugin)
    local helpers = require('incline.helpers')
    local devicons = require('nvim-web-devicons')
    require('incline').setup({
      window = {
        padding = 0,
        margin = { horizontal = 0 },
        overlap = {
          tabline = false,
          winbar = false,
          borders = true,
          statusline = false,
        }
      },
      -- Rendering function, have file type icon and file name
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
        if filename == '' then
          filename = '[No Name]'
        end
        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        return {
          ft_icon and {
            ft_icon, ' ',
            guibg = ft_color,
            guifg = helpers.contrast_color(ft_color)
          } or '',
          ' ',
          { filename, gui = modified and 'bold,italic' or 'bold' },
          ' ',
          group = 'DevIconWindows',
        }
      end,
    })
  end,
}
