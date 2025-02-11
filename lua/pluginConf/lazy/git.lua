-- <nixCats>/lua/pluginConf/lazy/git.lua
-- Git tools config

return {
  { -- Git status signs in the num column
    'gitsigns.nvim',
    for_cat = {
      cat = 'tools.git',
      default = true,
    },
    on_require = { 'gitsigns', },
    cmd = { 'Gitsigns', },
    event = { 'DeferredUIEnter', },
    after = function(plugin)
      require('gitsigns').setup({
        numhl = true,
        attach_to_untracked = false,
      })
    end,
  },
  { -- Git commands
    'vim-fugitive',
    for_cat = {
      cat = 'tools.git',
      default = true,
    },
    cmd = {
      'Git',
      'Gedit',
      'Gsplit',
      'Gdiffsplit',
      'Gvdiffsplit',
      'Gread',
      'Gwrite',
      'Ggrep',
      'GMove',
      'GRename',
      'GDelete',
      'GBrowse',
    },
  },
}
