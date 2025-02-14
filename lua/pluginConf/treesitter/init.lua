-- <nixCats>/lua/pluginConf/treesitter/init.lua
-- Treesitter config

return {
  {
    'nvim-treesitter-context',
    for_cat = {
      'tools.treesitter',
      default = true,
    },
    on_plugin = { 'nvim-treesitter', },
    event = 'DeferredUIEnter',
    after = function(plugin)
      require('treesitter-context').setup({
        enable = true,
        line_numbers = true,
      })
    end,
  },
  {
    'nvim-treesitter',
    for_cat = {
      cat = 'tools.treesitter',
      default = true,
    },
    dep_of = {
      'aerial.nvim',
      'nabla.nvim',
    },
    event = 'DeferredUIEnter',
    load = function (name)
      vim.cmd.packadd(name)
      vim.cmd.packadd('nvim-treesitter-refactor')
      vim.cmd.packadd('nvim-treesitter-textobjects')
    end,
    after = function(plugin)
      -- Configure treesitter
      require('nvim-treesitter.configs').setup({
        -- Highlight module
        highlight = {
          enable = true,
          disable = { 'latex', },
          additional_vim_regex_highlighting = { 'latex', 'markdown', },
        },
        -- Indent module
        indent = {
          enable = false,
        },
        -- Incremental selection
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-Space>',
            node_incremental = '<C-Space',
            node_decremental = '<C-S-Space',
            scope_incremental = '<C-s>',
          },
        },
        -- Text objects
        textobjects = require('pluginConf.treesitter.textobjects'),
        -- Refactor module
        refactor = require('pluginConf.treesitter.refactor'),
      })
    end,
  },
}
