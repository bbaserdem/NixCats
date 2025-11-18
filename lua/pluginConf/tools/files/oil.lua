-- <nixCats>/lua/pluginConf/oil.lua
-- Oil nvim; replacement for netrc
-- Not lazy loaded due to netrc setting

-- Configuring oil.nvim
return {
  {
    "oil.nvim",
    for_cat = {
      cat = "tools.files",
      default = true,
    },
    lazy = false,
    after = function(plugin)
      require("oil").setup({
        default_file_explorer = true,
        columns = {
          "icon",
          -- 'permissions',
          "size",
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
          signcolumn = "yes:2",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        -- Trashing
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        prompt_save_on_select_new_entry = true,
        lsp_file_methods = {
          enabled = true,
          autosave_changes = false,
        },
        constrain_cursor = "editable",
        -- Do filesystem changes
        watch_for_changes = true,
        -- View options
        view_options = {
          natural_order = false,
        },
      })
    end,
  },
  {
    "oil-git-status.nvim",
    for_cat = {
      cat = "tools.files",
      default = true,
    },
    on_plugin = "oil.nvim",
    after = function(plugin)
      require("oil-git-status").setup({
        index = {
          ["!"] = "!", -- Ignored
          ["?"] = "?", -- Untracked
          ["A"] = "A", -- Added
          ["C"] = "C", -- Copied
          ["D"] = "D", -- Deleted
          ["M"] = "M", -- Modified
          ["R"] = "R", -- Renamed
          ["T"] = "T", -- Type changed
          ["U"] = "U", -- Unmerged
          [" "] = " ", -- Unmodified
        },
        working_tree = {
          ["!"] = "!", -- Ignored
          ["?"] = "?", -- Untracked
          ["A"] = "A", -- Added
          ["C"] = "C", -- Copied
          ["D"] = "D", -- Deleted
          ["M"] = "M", -- Modified
          ["R"] = "R", -- Renamed
          ["T"] = "T", -- Type changed
          ["U"] = "U", -- Unmerged
          [" "] = " ", -- Unmodified
        },
      })
    end,
  },
}
