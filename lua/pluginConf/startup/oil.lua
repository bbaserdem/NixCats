-- <nixCats>/lua/pluginConf/startup/oil.lua
-- Snacks configuration entry point

-- Configuring oil.nvim
require('oil').setup({
  default_file_explorer = true,
  columns = {
    'icon',
    -- 'permissions',
    'size',
    -- 'mtime',
  },
  -- Buffer-local options to use for oil buffers
  buf_options = {
    buflisted = false,
    bufhidden = "hide",
  },
  -- Window-local options to use for oil buffers
  win_options = {
    wrap = false,
    signcolumn = "no",
    cursorcolumn = false,
    foldcolumn = "0",
    spell = false,
    list = false,
    conceallevel = 3,
    concealcursor = "nvic",
  },
  -- Trashing
  delete_to_trash = true,
  -- Do filesystem changes
  watch_for_changes = true,
  -- View options
  view_options = {
    natural_order = false,
  },
})
