-- <nixCats>/lua/pluginConf/lazy/colorscheme/init.lua
-- Theme-ing related settings

-- Get colorscheme from nixcats, or default to one

-- Register themeing related plugins to lazyload
require('lze').load {
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
    on_require = { 'nvim-web-devicons', },
    after = function (plugin)
      require('nvim-web-devicon').setup({
        color_icons = true,
      })
    end,
  },
  { -- Catppuccin theme
    'catppuccin-nvim',
    for_cat = {
      cat = 'theme',
      default = true,
    },
    colorscheme = {
      'catppuccin',
      'catppuccin-latte',
      'catppuccin-frappe',
      'catppuccin-macchiato',
      'catppuccin-mocha',
      'catppuccin-gruvbox',
      'catppuccin-gruvbox-light',
    },
    after = function(plugin)
      -- Apply any specific overrides
      local opt = {}
      local cs = nixCats.extra('colorscheme')
      if (
        (not require('nixCatsUtils').isNixCats) or
        (cs == 'catppuccin-gruvbox') or
        (cs == 'catppuccin-gruvbox-light')
      ) then
        opt = require('pluginConf.lazy.colorscheme.catppuccinGruvbox')
      end

      -- Set integrations options
      opt.integrations = {

      }

      -- Run configuration
      require('catppuccin').setup(opt)
    end,
  },
}
