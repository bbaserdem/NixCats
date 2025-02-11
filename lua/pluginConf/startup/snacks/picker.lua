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
      finder = 'explorer',
      sort = { fields = { 'sort' } },
      supports_live = true,
      focus = 'list',
      auto_close = false,
      jump = { close = false },
      layout = { preset = "sidebar", preview = false },
      formatters = {
        file = { filename_only = true },
        severity = { pos = "right" },
      },
      matcher = { sort_empty = false, fuzzy = true, },
      config = function(opts)
        return require('snacks.picker.source.explorer').setup(opts)
      end,
      win = {
        list = {
          keys = {
            ['<BS>'] = 'explorer_up',
            ['l'] = 'confirm',
            ['h'] = 'explorer_close', -- close directory
            ['a'] = 'explorer_add',
            ['d'] = 'explorer_del',
            ['r'] = 'explorer_rename',
            ['c'] = 'explorer_copy',
            ['m'] = 'explorer_move',
            ['o'] = 'explorer_open', -- open with system application
            ['P'] = 'toggle_preview',
            ['y'] = 'explorer_yank',
            ['u'] = 'explorer_update',
            ['<c-c>'] = 'tcd',
            ['<leader>/'] = 'picker_grep',
            ['<c-t>'] = 'terminal',
            ['.'] = 'explorer_focus',
            ['I'] = 'toggle_ignored',
            ['H'] = 'toggle_hidden',
            ['Z'] = 'explorer_close_all',
            [']g'] = 'explorer_git_next',
            ['[g'] = 'explorer_git_prev',
            [']d'] = 'explorer_diagnostic_next',
            ['[d'] = 'explorer_diagnostic_prev',
            [']w'] = 'explorer_warn_next',
            ['[w'] = 'explorer_warn_prev',
            [']e'] = 'explorer_error_next',
            ['[e'] = 'explorer_error_prev',
          },
        },
      },
    },
  },
}
