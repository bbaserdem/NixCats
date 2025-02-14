-- <nixCats>/lua/pluginConf/treesitter/textobjects.lua
-- Treesitter config for the textobjects field

return {
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
}
