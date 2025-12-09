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
    -- Apply transparency
    local _trans = false
    if require("nixCatsUtils").isNixCats then
      if nixCats.extra("colorscheme.translucent") ~= nil then
        _trans = nixCats.extra("colorscheme.translucent")
      end
    end

    -- Run configuration
    require("catppuccin").setup({
      integrations = {
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
      },
      transparent_background = _trans,
    })
  end,
}
