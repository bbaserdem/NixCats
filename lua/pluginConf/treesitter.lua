-- <nixCats>/lua/pluginConf/treesitter.lua
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
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['<leader>tf'] = {
                query = '@function.outer',
                desc = 'TS: select @function.outer',
              },
              ['<leader>tF'] = {
                query = '@function.inner',
                desc = 'TS: select @function.inner',
              },
              ['<leader>tc'] = {
                query = '@class.outer',
                desc = 'TS: select @class.outer',
              },
              ['<leader>tC'] = {
                query = '@class.inner',
                desc = 'TS: select @class.inner',
              },
              ['<leader>ts'] = {
                query = '@local.scope',
                desc = 'TS: select @local.scope',
              },
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>ta'] = {
                query = '@parameter.inner',
                desc = 'TS: swap.next @parameter.inner',
              },
            },
            swap_previous = {
              ['<leader>tA'] = {
                query = '@parameter.inner', desc = 'TS: swap.prev @parameter.inner',
              },
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              [']m'] = {
                query = '@function.outer',
                desc = 'TS: move.next_start @function.outer',
              },
              [']]'] = {
                query = '@class.outer',
                desc = 'TS: move.next_start @class.outer',
              },
            },
            goto_next_end = {
              [']M'] = {
                query = '@function.outer',
                desc = 'TS: move.next_end @parameter.inner',
              },
              [']['] = {
                query = '@class.outer',
                desc = 'TS: move.next_end @class.outer',
              },
            },
            goto_previous_start = {
              ['[m'] = {
                query = '@function.outer',
                desc = 'TS: move.prev_start @function.outer',
              },
              ['[['] = {
                query = '@class.outer',
                desc = 'TS: move.prev_start @class.outer',
              },
            },
            goto_previous_end = {
              ['[M'] = {
                query = '@function.outer',
                desc = 'TS: move.prev_end @function.outer',
              },
              ['[]'] = {
                query = '@class.outer',
                desc = 'TS: move.prev_end @class.outer',
              },
            },
          },
          -- LSP interoperation
          lsp_interop = {
            enable = true,
            border = 'none',
            floating_preview_opts = {},
            peek_definition_code = {
              ['<leader>ti'] = {
                query = '@function.outer',
                desc = 'TS: lsp_interop @function.outer',
              },
              ['<leader>tI'] = {
                query = '@class.outer',
                desc = 'TS: lsp_interop @class.outer',
              },
            },
          },
        },
        -- Refactor module
        refactor = {
          -- Highlight definition and usage for the current symbol
          highlight_definitions = {
            enable = false,
            clear_on_cursor_move = true,
          },
          -- Highlight the block from the current scope
          highlight_current_scope = { enable = false, },
          -- Renames the symbol under the cursor in this file
          smart_rename = {
            enable = true,
            keymaps = {
              smart_rename = '<leader>tr',
            },
          },
          -- Go to definition for the symbol under cursor
          navigation = {
            enable = true,
            keymaps = {
              goto_definition = '<leader>td',
              list_definitions = '<leader>tl',
              list_definitions_toc = '<leader>tL',
              goto_next_usage = '<leader>tn',
              goto_previous_usage = '<leader>tN',
            },
          },
        },
      })
    end,
  },
}
