-- <nixCats>/lua/pluginConf/languages/python.lua
-- Python plugins

return {
  -- DAP adapter
  "nvim-dap-python",
  for_cat = {
    cat = "languages.python",
    default = true,
  },
  ft = { "python" },
  on_require = { "dap-python" },
  after = function(plugin)
    require("dap-python").setup("python3")
  end,
}
