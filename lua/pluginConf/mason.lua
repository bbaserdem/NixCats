-- <nixCats>/lua/pluginConf/mason.lua
-- Mason setup

return {
  {
    'mason.nvim',
    event = { 'DeferredUIEnter', },
    enabled = require('nixCatsUtils').isNixCats ~= true,
    cmd = {
      'Mason',
      'MasonUpdate',
      'MasonInstall',
      'MasonUninstall',
      'MasonUninstallAll',
      'MasonLog',
    },
    on_require = { 'mason', },
    on_plugin = {
      'mason-lspconfig.nvim',
      'mason-nvim-dap.nvim',
    },
    after = function(plugin)
      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'ltex',
          'nixd',
          'ts_ls',
        },
      })
      require('mason-nvim-dap').setup({
        ensure_installed = {
        },
      })
    end,
  }, {
    'mason-lspconfig.nvim',
    enabled = require('nixCatsUtils').isNixCats ~= true,
    cmd = {
      'LspInstall',
      'LspUninstall',
    },
    on_require = { 'mason-lspconfig', },
    dep_of = { 'nvim-lspconfig', },
  }, {
    'mason-nvim-dap.nvim',
    enabled = require('nixCatsUtils').isNixCats ~= true,
    cmd = {
      'DapInstall',
      'DapUninstall',
    },
    on_require = { 'mason-nvim-dap', },
    dep_of = { 'nvim-dap', },
  }
}
