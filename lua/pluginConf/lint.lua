-- <nixCats>/lua/pluginConf/lint.lua
-- Code linter

return {
  'nvim-lint',
  for_cat = {
    cat = 'functionality',
    default = true,
  },
  event = { 'BufWritePost', },
  on_require = { 'lint', },
}
