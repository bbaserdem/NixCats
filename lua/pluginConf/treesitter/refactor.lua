-- <nixCats>/lua/pluginConf/treesitter/refactor.lua
-- Treesitter config for refactor settings

return {
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
}
