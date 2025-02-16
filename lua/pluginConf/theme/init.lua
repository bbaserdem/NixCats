-- <nixCats>/lua/pluginConf/theme/init.lua
-- Theme-ing related settings

-- Get colorscheme from nixcats, or default to one

-- Register themeing related plugins to lazyload
return {
  { import = 'pluginConf/theme/catppuccin', },
  { import = 'pluginConf/theme/gruvbox', },
  { import = 'pluginConf/theme/onedark', },
  { import = 'pluginConf/theme/statusline', },
  { import = 'pluginConf/theme/tabline', },
  { -- LSP kind icons
    'lspkind.nvim',
    for_cat = {
      cat = 'theme',
      default = true,
    },
    dep_of = {
      'catppuccin-nvim',
    },
  }, {
    'nvim-web-devicons',
    for_cat = {
      cat = 'theme',
      default = 'true',
    },
    -- Don't lazy load since things that need us is not lazy loaded
    lazy = false,
    priority = 10,
    -- Still keep a dependence list
    dep_of = {
      'oil.nvim',
      'lualine.nvim',
      'tabby.nvim',
      'incline.nvim',
      'lualine.nvim',
      'which-key.nvim',
      'neo-tree.nvim',
    },
    after = function (plugin)
      require('nvim-web-devicons').setup({
        color_icons = true,
      })
    end,
  },
}
