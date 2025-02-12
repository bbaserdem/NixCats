-- <nixCats>/lua/pluginConf/lazy/markdown.lua
-- Markdown config

return {
  { -- Preview
    'glow.nvim',
    for_cat = {
      cat = 'languages.markdown',
      default = true,
    },
    ft = { 'markdown', },
    on_require = { 'glow', },
    cmd = { 'Glow', },
  },
  { -- 
    'mkdnflow.nvim',
    for_cat = {
      cat = 'languages.markdown',
      default = true,
    },
    ft = { 'markdown', 'md', 'rmd', },
    on_plugin = { 'nvim-cmp', },
    on_require = { 'mkdnflow', },
    after = function (plugin)
      require('mkdnflow').setup({
        modules = {
          cmp = true,
        },
      })
    end,
  },
}
