-- <nixCats>/lua/pluginConf/lazy/aerial.lua
-- Aerial config

return {
  'aerial.nvim',
  for_cat = {
    cat = 'status',
    default = true,
  },
  cmd = {
    'AerialToggle',
    'AerialOpen',
    'AerialOpenAll',
    'AerialClose',
    'AerialCloseAll',
    'AerialNext',
    'AerialPrev',
    'AerialGo',
    'AerialInfo',
    'AerialNavToggle',
    'AerialNavOpen',
    'AerialNavClose',
  },
  dep_of = {
    'lualine.nvim',
  },
  require = { 'aerial', },
  ft = 'lua',
  after = function(plugin)
    require('aerial').setup({
      backends = { 'treesitter', 'lsp', 'markdown', 'man', 'asciidoc', },
      layout = {
        default_direction = 'prefer_left',
      },
      attach_mode = 'global',
      show_guides = true,
      guides = {
        mid_item    = '╠═',
        last_item   = '╚═',
        nested_top  = '║ ',
        whitespace  = '  ',
      },
      float = {
        border = 'rounded',
        relative = 'win',
      },
    })
  end,
}
