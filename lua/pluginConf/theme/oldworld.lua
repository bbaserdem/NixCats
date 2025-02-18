-- <nixCats>/lua/pluginConf/theme/oldworld.lua
-- Oldworld for nvim

return {
  "oldworld.nvim",
  for_cat = {
    cat = "theme",
    default = true,
  },
  in_extra = {
    key = "colorscheme.name",
    value = "oldworld",
  },
  colorscheme = {
    "oldworld",
  },
  after = function(plugin)
    require("oldworld").setup({
      integrations = {
        alpha = false,
        cmp = true,
        flash = false,
        gitsigns = true,
        hop = false,
        indent_blankline = false,
        lazy = false,
        lsp = true,
        markdown = true,
        mason = true,
        navic = false,
        neo_tree = true,
        neogit = false,
        neorg = false,
        noice = false,
        notify = false,
        rainbow_delimiters = false,
        telescope = false,
        treesitter = true,
      },
    })
  end,
}
