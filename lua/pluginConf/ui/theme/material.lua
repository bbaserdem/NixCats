-- <nixCats>/lua/pluginConf/theme/material.lua
-- Material theme for nvim

return {
  "material.nvim",
  for_cat = {
    cat = "ui.theme",
    default = true,
  },
  in_extra = {
    key = "colorscheme.name",
    value = "material",
  },
  colorscheme = {
    "material",
    "material-darker",
    "material-deep-ocean",
    "material-lighter",
    "material-oceanic",
    "material-palenight",
  },
  event = { "DeferredUIEnter" },
  after = function(plugin)
    local _trans = false

    if require("nixCatsUtils").isNixCats then
      if nixCats.extra("colorscheme.name") == "material" then
        vim.g.material_style = nixCats.extra("colorscheme.style")
        if nixCats.extra("colorscheme.translucent") ~= nil then
          _trans = nixCats.extra("colorscheme.translucent")
        end
      end
    end

    -- Load us
    require("material").setup({
      plugins = {
        "dap",
        "fidget",
        "gitsigns",
        "mini",
        "neo-tree",
        "nvim-cmp",
        "nvim-web-devicons",
        "trouble",
        "which-key",
      },
      disable = {
        background = _trans,
      },
      lualine_style = "stealth",
    })
  end,
}
