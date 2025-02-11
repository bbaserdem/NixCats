-- <nixCats>/lua/pluginConf/startup/snacks/picker.lua
-- Picker settings

-- Configuring picker
return {
  prompt = " ",
  focus = "input",
  layout = {
    cycle = true,
    --- Use the default layout or vertical if the window is too narrow
    preset = function()
      return vim.o.columns >= 120 and "default" or "vertical"
    end,
  },
  matcher = {
    fuzzy = true, -- use fuzzy matching
    smartcase = true, -- use smartcase
    ignorecase = true, -- use ignorecase
    sort_empty = false, -- sort results when the search string is empty
    filename_bonus = true, -- give bonus for matching file names (last part of the path)
    file_pos = true, -- support patterns like `file:line:col` and `file:line`
    -- the bonusses below, possibly require string concatenation and path normalization,
    -- so this can have a performance impact for large lists and increase memory usage
    cwd_bonus = false, -- give bonus for matching files in the cwd
    frecency = true, -- frecency bonus
    history_bonus = false, -- give more weight to chronological order
  },
  sort = {
    -- default sort is by score, text length and index
    fields = { "score:desc", "#text", "idx" },
  },
  ui_select = true,
  -- Picker sources
  sources = {
    explorer = {
      follow_file = true,
      tree = true,
      git_status = true,
      git_status_open = false,
      git_untracked = true,
      diagnostics = true,
      diagnostics_open = false,
      watch = true,
      -- Other opts
      supports_live = true,
      matcher = { sort_empty = false, fuzzy = true, },
    },
  },
}
