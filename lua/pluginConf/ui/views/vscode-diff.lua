-- <nixCats>/lua/pluginConf/ui/views/twilight.lua
-- Inactive code dimmer

return {
  "vscode-diff.nvim",
  for_cat = {
    cat = "ui.views",
    default = true,
  },
  cmd = {
    "CodeDiff",
  },
  on_require = { "vscode-diff" },
  after = function(plugin)
    require("vscode-diff").setup({})
  end,
}
