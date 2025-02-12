-- <nixCats>/lua/pluginConf/lazy/lualine.lua
-- Lualine config

return {
  'lualine.nvim',
  for_cat = {
    cat = 'status',
    default = true,
  },
  event = { 'BufWritePost', },
  on_require = { 'lint', },
}
