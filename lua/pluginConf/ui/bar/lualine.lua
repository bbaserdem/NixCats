-- <nixCats>/lua/pluginConf/theme/lualine.lua
-- Status line + winbar config

-- lualine nvim setup
return {
  "lualine.nvim",
  for_cat = {
    cat = "ui.bar",
    default = true,
  },
  event = { "DeferredUIEnter" },
  dep_of = { "tabby.nvim" },
  on_require = { "lualine" },
  after = function(plugin)
    -- Trouble winbar component, with loading guard
    -- FIX: winbar fix from;
    -- https://github.com/folke/trouble.nvim/issues/569
    -- https://github.com/nvim-lualine/lualine.nvim/pull/1368
    -- https://github.com/folke/trouble.nvim/pull/616
    --[[
    vim.api.nvim_set_hl(0, "WinBar", { link = "lualine_c_normal" })

    local troubleLine = {}
    local _ok, _trouble = pcall(require, 'trouble')
    if _ok then
      troubleLine = _trouble.statusline({
        mode = 'lsp_document_symbols',
        groups = {},
        title = false,
        filter = { range = true, },
        format = "{kind_icon}{symbol.name:Normal}",
        hl_group = 'lualine_b_normal',
      })
    else
      troubleLine.get = ''
      troubleLine.has = false
    end
    --]]

    -- Pomodoro timer for statusbar
    local pomoLine = function()
      local ok, pomo = pcall(require, "pomo")
      if not ok then
        return ""
      end
      local timer = pomo.get_first_to_finish()
      if timer == nil then
        return ""
      end
      return "󰄉 " .. tostring(timer)
    end

    -- Statusbar config
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        always_divide_middle = true,
        globalstatus = true,
        disabled_filetypes = {
          statusline = {},
          winbar = {
            "aerial-nav",
          },
        },
      },
      -- The configuration
      tabline = {},
      winbar = {
        lualine_a = {},
        lualine_b = {
          "aerial",
          --[[
          { troubleLine.get,
            cond = troubleLine.has,
          },
          --]]
        },
        lualine_x = {},
        lualine_y = {
          {
            "filename",
            file_status = true,
            newfile_status = true,
            path = 1,
            shorting_target = 40,
            symbols = {
              modified = " ",
              readonly = " ",
              unnamed = " ",
              newfile = " ",
            },
          },
        },
        lualine_z = {
          {
            "filetype",
            icon_only = false,
            colored = false,
          },
        },
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          {
            "filename",
            file_status = true,
            newfile_status = true,
            path = 1,
            shorting_target = 40,
            symbols = {
              modified = " ",
              readonly = " ",
              unnamed = " ",
              newfile = " ",
            },
          },
          {
            "filetype",
            icon_only = true,
            colored = true,
          },
        },
      },
      sections = {
        lualine_a = {
          "branch",
        },
        lualine_b = {
          "filetype",
          "diff",
          {
            "diagnostics",
            sources = {
              "nvim_lsp",
              "nvim_diagnostic",
            },
          },
        },
        lualine_c = {
          {
            "buffers",
            max_length = vim.o.columns * 2 / 3,
            filetype_names = {
              TelescopePrompt = "󰍉 ",
              dashboard = "󰨝 ",
            },
          },
        },
        lualine_x = {
          pomoLine,
        },
        lualine_y = {
          "selectioncount",
          "searchcount",
        },
        lualine_z = {
          "progress",
          "location",
          "mode",
        },
      },
    })
  end,
}
