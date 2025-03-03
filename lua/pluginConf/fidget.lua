-- <nixCats>/lua/pluginConf/fidget.lua
-- LSP status showing

return {
  'fidget.nvim',
  for_cat = {
    cat = 'status',
    default = true,
  },
  event = { 'DeferredUIEnter', },
  cmd = { 'Fidget', },
  on_require = { 'fidget', },
  after = function(plugin)
    require('fidget').setup({
      notification = {
        window = {
          winblend = 0,
        },
      },
    })
  end,
}
