-- <nixCats>/lua/pluginConf/lazy/lazydev.lua
-- Lazydev config

return {
  'lazydev.nvim',
  for_cat = {
    cat = 'languages.lua',
    default = true,
  },
  cmd = { 'LazyDev' },
  ft = 'lua',
  after = function(plugin)
    require('lazydev').setup({
      library = {
        'nvim-dap-ui',
        {
          words = { 'nixCats' },
          path = (require('nixCats').nixCatsPath or "") .. '/lua'
        },
      },
    })
  end,
}
