-- <nixCats>/lua/pluginConf/lazy/neotree.lua
-- Neo-tree config

return {
  {
    'nvim-window-picker',
    for_cat = {
      cat = 'functionality',
      default = true,
    },
    dep_of = {
      'neo-tree.nvim',
    },
    after = function(plugin)
      require('window-picker').setup({
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal", "quickfix" },
          },
        },
      })
    end,
  }, {
    'neo-tree.nvim',
    for_cat = {
      cat = 'functionality',
      default = true,
    },
    cmd = {
      'Neotree',
    },
    -- We want deferreduienter to modify the gutter icons
    after = function(plugin)
      require('neo-tree').setup({
      })
    end,
  },
}
