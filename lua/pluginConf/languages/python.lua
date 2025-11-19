-- <nixCats>/lua/pluginConf/python.lua
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
}
