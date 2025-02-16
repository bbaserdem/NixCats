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
    local _style = 'mocha'

    if require('nixCatsUtils').isNixCats then
      -- Only do styling if cats scheme is catppuccin
      if nixCats.extra('colorscheme.name') == 'catppuccin' then
        _style = nixCats.extra('colorscheme.style')
        local _trans = nixCats.extra('colorscheme.translucency')

        -- Do gruvbox override if asked
        if (_style == 'gruvbox') or (_style == 'gruvbox-light') then
          opt = require('pluginConf.theme.catppuccinGruvbox')
        -- If not, set style as the default option 
        else
          opt.flavour = _style
        end

        -- Translucency
        if _trans ~= nil then
          opt.transparent_background = _trans
        end
      end
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
