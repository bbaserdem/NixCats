-- <nixCats>/lua/pluginConf/lazy/util.lua
-- Utility functions to be lazy loaded

return {
  { -- Library plugins
    'plenary.nvim',
    for_cat = {
      cat = 'main',
      default = true,
    },
    dep_of = {
      'mkdnflow.nvim',
      'obsidian.nvim',
    },
    on_require = { 'plenary', },
  }, {
    'nui.nvim',
    for_cat = {
      cat = 'main',
      default = true,
    },
    dep_of = {
      'neo-tree.nvim',
    },
    on_require = { 'nui', },
  }, { -- Display images in kitty
    'image.nvim',
    for_cat = {
      cat = 'functionality',
      default = true,
    },
    dep_of = {
      'neo-tree.nvim',
    },
    on_require = { 'image', },
    after = function(plugin)
      require('image').setup({
        backend = 'kitty',
        processor = 'magick_rock',
        integrations = {
          markdown = { enabled = false, },
          neorg = { enabled = false, },
          typst = { enabled = false, },
          html = { enabled = false, },
          css = { enabled = false, },
        },
      })
    end,
  }, { -- Make dir when saving
    'mkdir.nvim',
    for_cat = {
      cat = 'functionality',
      default = true,
    },
    event = { 'BufWritePre', },
  },
}
