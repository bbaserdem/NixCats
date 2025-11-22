-- <nixCats>/lua/pluginConf/ui/theme/init.lua
-- Theme-ing related settings

-- Get colorscheme from nixcats, or default to one

-- Register themeing related plugins to lazyload
return {
  { import = "pluginConf/theme/catppuccin" },
  { import = "pluginConf/theme/cyberdream" },
  { import = "pluginConf/theme/eink" },
  { import = "pluginConf/theme/gruvbox" },
  { import = "pluginConf/theme/gruvboxMaterial" },
  { import = "pluginConf.ui.theme/kanagawa" },
  { import = "pluginConf.ui.theme.material" },
  { import = "pluginConf/theme/melange" },
  { import = "pluginConf/theme/nightfox" },
  { import = "pluginConf/theme/onedark" },

  -- Web-Devicons
  {
    "nvim-web-devicons",
    for_cat = {
      cat = "ui.theme",
      default = "true",
    },
    -- We are needed by non-lazy loaded things
    lazy = false,
    priority = 10,
    dep_of = {
      "oil.nvim",
      "neo-tree.nvim",
    },
    after = function(plugin)
      require("nvim-web-devicons").setup({
        color_icons = true,
      })
    end,
  },
}
