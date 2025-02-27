-- <nixCats>/lua/pluginConf/markdown.lua
-- Markdown config

return {
  { -- Preview
    "glow.nvim",
    for_cat = {
      cat = "languages.markdown",
      default = true,
    },
    ft = { "markdown" },
    on_require = { "glow" },
    cmd = { "Glow" },
  },
  { -- Equation parser
    "nabla.nvim",
    for_cat = {
      cat = "languages.markdown",
      default = true,
    },
    ft = { "markdown" },
    on_require = { "nabla" },
  },
  { -- Navigating markdown links
    "mkdnflow.nvim",
    for_cat = {
      cat = "languages.markdown",
      default = true,
    },
    ft = { "markdown", "md", "rmd" },
    on_plugin = { "nvim-cmp" },
    on_require = { "mkdnflow" },
    after = function(plugin)
      require("mkdnflow").setup({
        modules = {
          cmp = true,
        },
      })
    end,
  },
  { -- Obsidian integration
    "obsidian.nvim",
    for_cat = {
      cat = "languages.markdown",
      default = true,
    },
    ft = { "markdown" },
    on_require = { "obsidian" },
    after = function(plugin)
      -- Get default, or overriden, workspaces table
      local ws = {
        {
          name = "Buffer parent",
          path = function()
            return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
          end,
        },
      }
      if require("nixCatsUtils").isNixCats then
        local ws_nc = nixCats.extra("obsidian.workspaces")
        -- Replace if not empty
        if next(ws_nc) ~= nil then
          ws = ws_nc
        end
      end

      require("obsidian").setup({
        workspaces = ws,
        -- Favor markdown-render.nvim for rendering
        ui = { enable = false },
        mappings = {},
        new_notes_location = "current_dir",
        preferred_link_style = "wiki",
        follow_url_func = function(url)
          vim.fn.jobstart("xdg-open", url)
        end,
        follow_img_func = function(img)
          vim.fn.jobstart("xdg-open", img)
        end,
        use_advanced_uri = true,
        open_app_foreground = true,
        --[[
        picker = {
          name = 'telescope.nvim',
        },
        --]]
        attachments = {
          img_folder = "Userdata/Attachments/Images",
          img_name_func = function()
            return string.format("%s-", os.time())
          end,
        },
      })
    end,
  },
  { -- Markdown rendering
    "render-markdown.nvim",
    for_cat = {
      cat = "languages.markdown",
      default = true,
    },
    ft = { "markdown" },
    cmd = { "RenderMarkdown" },
    after = function(plugin)
      require("render-markdown").setup({
        enabled = true,
        render_modes = { "n", "c", "t" },
        latex = {
          enabled = false,
        },
        max_file_size = 10.0,
        pipe_table = {
          border = {
            "╔",
            "╤",
            "╗",
            "╟",
            "┼",
            "╢",
            "╚",
            "╧",
            "╝",
            "│",
            "─",
          },
        },
      })
    end,
  },
}
