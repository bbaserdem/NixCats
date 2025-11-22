-- <nixCats>/lua/pluginConf/tools/rainbow.lua
-- Rainbow delimiters

return {
  { -- Git status signs in the num column
    "rainbow-delimiters.nvim",
    for_cat = {
      cat = "tools.treesitter",
      default = true,
    },
    event = { "DeferredUIEnter" },
    dep_of = { "indent-blankline.nvim" },
    after = function(plugin)
      -- Change color groups
      local set_color = function()
        vim.api.nvim_set_hl(0, "RainbowDelimiterRed", "Conditional")
        vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", "Typedef")
        vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", "DiagnosticInfo")
        vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", "Special")
        vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", "DiagnosticOk")
        vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", "Constant")
        vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", "Include")
      end

      -- Set the autocommand to link color groups on every colorscheme change
      set_color()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = set_color,
      })

      --
      require("rainbow-delimiters.setup").setup({
        strategy = {
          [""] = "rainbow-delimiters.strategy.global",
          vim = "rainbow-delimiters.strategy.local",
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        priority = {
          [""] = 110,
          lua = 210,
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      })
    end,
  },
}
