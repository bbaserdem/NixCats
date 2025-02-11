-- <nixCats>/lua/pluginConf/lazydev.lua
-- Lazydev config

return {
  'which-key.nvim',
  for_cat = {
    cat = 'status',
    default = true,
  },
  event = { 'DeferredUIEnter' },
  after = function(plugin)
    require('which-key').setup({
      preset = 'helix',
      delay = 100,
      notify = true,
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = true,
          motions = true,
          text_objects = true,
          windown = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      show_help = true,
      show_keys = true,
    })
  end,
}
