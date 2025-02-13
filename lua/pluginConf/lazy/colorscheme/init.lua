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
    dep_of = {
      'lualine.nvim',
      'tabby.nvim',
      'incline.nvim',
      'which-key.nvim',
    },
    after = function (plugin)
      require('nvim-web-devicons').setup({
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
    dep_of = {
      'tabby.nvim',
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

      -- Disable kitty detection, I rather have the transparent background
      opt.kitty = false
      -- Set integrations options
      opt.integrations = {

      }

      -- Run configuration
      require('catppuccin').setup(opt)
    end,
  },
}
