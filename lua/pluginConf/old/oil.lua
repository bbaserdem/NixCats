-- <nixCats>/lua/pluginConf/oil.lua
-- Oil nvim; replacement for netrc
-- Not lazy loaded due to netrc setting

-- Configuring oil.nvim
return {
  'oil.nvim',
  for_cat = {
    cat = 'functionality',
    default = true,
  },
  lazy = false,
  after = function(plugin)
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
  end,
}
