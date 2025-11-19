-- <nixCats>/lua/pluginConf/tools/debug.lua
-- Debug adapter protocol

return {
  {
    "nvim-dap",
    for_cat = {
      cat = "tools.debug",
      default = true,
    },
    dep_of = {
      "nvim-dap-ui",
      "nvim-dap-virtual-text",
      "nvim-dap-python",
    },
    on_require = { "dap" },
    cmd = {
      "DapNew",
    },
  },
  {
    "nvim-dap-ui",
    for_cat = {
      cat = "tools.debug",
      default = true,
    },
    on_require = {
      "dapui",
    },
    after = function(plugin)
      require("dapui").setup()
    end,
  },
  {
    "nvim-dap-virtual-text",
    for_cat = {
      cat = "tools.debug",
      default = true,
    },
    on_plugin = {
      "nvim-dap-ui",
      "nvim-dap",
    },
    on_require = {
      "nvim-dap-virtual-text",
    },
    after = function(plugin)
      require("nvim-dap-virtual-text").setup()
    end,
  },
}
