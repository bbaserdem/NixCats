-- <nixCats>/lua/pluginConf/languages/markdown.lua
-- Lazy loaded plugins config

local M = {
  { -- Equation parser
    "nabla.nvim",
    for_cat = {
      cat = { "languages.markdown", "languages.latex" },
      default = true,
    },
    ft = { "markdown" },
    on_require = { "nabla" },
  },
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
        quote = {
          repeat_linebreak = true,
        },
        latex = {
          enabled = false, -- Use nabla for this
        },
        heading = {
          sign = false,
          position = "inline",
          width = "block",
          left_margin = 0.5,
          left_pad = 0.2,
          right_pad = 0.2,
        },
        max_file_size = 10.0,
        pipe_table = {
          border = { "╔", "╤", "╗", "╟", "┼", "╢", "╚", "╧", "╝", "│", "─" },
        },
      })
    end,
  },
}

return M
