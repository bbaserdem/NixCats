-- <nixCats>/lua/pluginConf/theme/catppuccin.lua
-- Catppuccin themeing

-- Get colorscheme from nixcats, or default to one

-- Register themeing related plugins to lazyload
return { -- Catppuccin theme
  "catppuccin-nvim",
  for_cat = {
    cat = "theme",
    default = true,
  },
  in_extra = {
    key = "colorscheme.name",
    value = "catppuccin",
  },
  dep_of = {
    "tabby.nvim",
  },
  colorscheme = {
    "catppuccin",
    "catppuccin-latte",
    "catppuccin-frappe",
    "catppuccin-macchiato",
    "catppuccin-mocha",
    "catppuccin-gruvbox",
    "catppuccin-gruvbox-light",
  },
  event = { "DeferredUIEnter" },
  after = function(plugin)
    -- Apply any specific overrides
    local opt = {}
    local _style = "mocha"
    local _trans = false

    if require("nixCatsUtils").isNixCats then
      if nixCats.extra("colorscheme.name") == "catppuccin" then
        if nixCats.extra("colorscheme.translucent") ~= nil then
          _trans = nixCats.extra("colorscheme.translucent")
        end

        -- Do gruvbox override if asked
        _style = nixCats.extra("colorscheme.style")
        if string.sub(_style, 7) == "gruvbox" then
          opt = require("pluginConf.theme.catppuccinGruvbox")
          if _style == "gruvbox" then
            _style = "mocha"
          else
            _style = "latte"
          end
        end
      end
    end

    opt.flavour = _style
    opt.transparent_background = _trans

    -- DAP integration
    vim.fn.sign_define("DapBreakpoint", {
      text = "●",
      texthl = "DapBreakpoint",
      linehl = "",
      numhl = "",
    })
    vim.fn.sign_define("DapBreakpointCondition", {
      text = "●",
      texthl = "DapBreakpointCondition",
      linehl = "",
      numhl = "",
    })
    vim.fn.sign_define("DapLogPoint", {
      text = "◆",
      texthl = "DapLogPoint",
      linehl = "",
      numhl = "",
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
      lsp_trouble = true,
      which_key = true,
    }

    -- Run configuration
    require("catppuccin").setup(opt)
  end,
}
