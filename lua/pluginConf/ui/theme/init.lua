-- <nixCats>/lua/pluginConf/theme/init.lua
-- Theme-ing related settings

-- Get colorscheme from nixcats, or default to one

-- Register themeing related plugins to lazyload
return {
  -- { import = "pluginConf/theme/catppuccin" },
  -- { import = "pluginConf/theme/cyberdream" },
  -- { import = "pluginConf/theme/gruvbox" },
  -- { import = "pluginConf/theme/gruvboxMaterial" },
  -- { import = "pluginConf/theme/kanagawa" },
  -- { import = "pluginConf/theme/lualine" },
  { import = "pluginConf.ui.theme.material" },
  -- { import = "pluginConf/theme/melange" },
  -- { import = "pluginConf/theme/minitheme" },
  -- { import = "pluginConf/theme/nightfox" },
  -- { import = "pluginConf/theme/oldworld" },
  -- { import = "pluginConf/theme/onedark" },
  -- { import = "pluginConf/theme/rosepine" },
  -- { import = "pluginConf/theme/tabby" },
  -- { import = "pluginConf/theme/tokyonight" },
  -- { import = "pluginConf/theme/vscode" },

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
