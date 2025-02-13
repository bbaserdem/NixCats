-- <nixCats>/lua/pluginConf/lazy/trouble.lua
-- Trouble config

return {
  'trouble.nvim',
  for_cat = {
    cat = 'status',
    default = true,
  },
  dep_of = {
    'lualine.nvim',
  },
  -- We want deferreduienter to modify the gutter icons
  event = { 'DeferredUIEnter' },
  after = function(plugin)
    require('trouble').setup({
      icons = {
        top =         '║ ',
        middle =      '╟─',
        last =        '╙─',
        fold_open =   ' ',
        fold_closed = ' ',
        ws =          '  ',
      },
    })
  end,
}
