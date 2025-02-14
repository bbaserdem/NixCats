-- <nixCats>/lua/pluginConf/theme/catppuccin.lua
-- Catppuccin themeing

-- Get colorscheme from nixcats, or default to one

-- Register themeing related plugins to lazyload
return { -- Catppuccin theme
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

    -- DAP integration
    vim.fn.sign_define('DapBreakpoint', {
      text = '●',
      texthl = 'DapBreakpoint',
      linehl = '',
      numhl = '',
    })
    vim.fn.sign_define('DapBreakpointCondition', {
      text = '●',
      texthl = 'DapBreakpointCondition',
      linehl = '',
      numhl = '',
    })
    vim.fn.sign_define('DapLogPoint', {
      text = '◆',
      texthl = 'DapLogPoint',
      linehl = '',
      numhl = '',
    })

    -- Disable kitty detection, I rather have the transparent background
    opt.kitty = false
    -- Set integrations options
    opt.integrations = {
      aerial = true,
      blink_cmp = true,
      fidget = true,
      gitsigns = true,
      markdown = true,
      mason = true,
      mini = true,
      neotree = true,
      cmp = true,
      dap = true,
      dap_ui = true,
      treesitter_context = true,
      snacks = true,
      telescope = {
        enabled = true,
        -- style = 'nvchad',
      },
      lsp_trouble = true,
      which_key = true,
    }

    -- Run configuration
    require('catppuccin').setup(opt)
  end,
}
