-- <nixCats>/lua/pluginConf/theme/init.lua
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
        opt = require('pluginConf.theme.catppuccinGruvbox')
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
