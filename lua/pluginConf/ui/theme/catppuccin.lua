-- <nixCats>/lua/pluginConf/ui/theme/catppuccin.lua
-- Catppuccin themeing

-- Get colorscheme from nixcats, or default to one

-- Register themeing related plugins to lazyload
return { -- Catppuccin theme
  "catppuccin-nvim",
  for_cat = {
    cat = "ui.theme",
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
