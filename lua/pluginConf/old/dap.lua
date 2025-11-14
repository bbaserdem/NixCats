-- <nixCats>/lua/pluginConf/dap.lua
-- Debug adapter protocol

return {
  {
    'nvim-dap-ui',
    for_cat = {
      cat = 'debug',
      default = true,
    },
    on_require = { 'dapui', },
    after = function(plugin)
      require('dapui').setup()
    end,
  },
  {
    'nvim-dap-virtual-text',
    for_cat = {
      cat = 'debug',
      default = true,
    },
    on_plugin = { 'nvim-dap-ui', 'nvim-dap', },
    on_require = { 'nvim-dap-virtual-text', },
    after = function(plugin)
      require('dapui').setup()
    end,
  },
  {
    'nvim-dap',
    for_cat = {
      cat = 'debug',
      default = true,
    },
    dep_of = {
      'nvim-dap-ui',
      'nvim-dap-virtual-text',
    },
    on_require = { 'dap', },
    cmd = {
      'DapNew',
    },
  },
  {
    'nvim-nio',
    for_cat = {
      cat = 'debug',
      default = true,
    },
    dep_of = {
      'nvim-dap-ui',
    },
  }
}
