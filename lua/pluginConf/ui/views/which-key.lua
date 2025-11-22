-- <nixCats>/lua/pluginConf/ui/views/which-key.lua
-- Lazydev config

return {
  "which-key.nvim",
  for_cat = {
    cat = "ui.views",
    default = true,
  },
  lazy = false,
  -- This lazy loads which-key before mini.nvim is loaded
  -- Hopefully this makes the pcall(require, 'mini.icons') fail
  -- If it fails but nvim-web-devicons succeeds, we will have devicons here
  -- dep_of = { 'mini.nvim', },
  -- event = { 'DeferredUIEnter' },
  after = function(plugin)
    require("which-key").setup({
      preset = "helix",
      delay = 0,
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
