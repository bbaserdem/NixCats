-- <nixCats>/lua/pluginConf/tools/search/telescope.lua
-- Telescope; picker

return {
  {
    "telescope.nvim",
    for_cat = {
      cat = "tools.search",
      default = true,
    },
    dep_of = {
      "urlview.nvim",
    },
    after = function(plugin)
      local telescope = require("telescope")

      telescope.setup({
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          ["ui-select"] = {
            telescope.get_dropdown({}),
          },
        },
      })

      -- Load the extensions
      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")

      -- Optional extensions
      local dap_status, dap = pcall(require, "dap")
      if dap_status then
        telescope.load_extension("dap")
      end
      local manix_status, manix = pcall(require, "telescope-manix")
      if manix_status then
        telescope.load_extension("manix")
      end
    end,
  },
  {
    "telescope-ui-select.nvim",
    for_cat = {
      cat = { "tools.search" },
      default = true,
    },
    dep_of = "telescope.nvim",
  },
  {
    "telescope-fzf-native.nvim",
    for_cat = {
      cat = "tools.search",
      default = true,
    },
    dep_of = "telescope.nvim",
  },
  {
    "telescope-dap.nvim",
    for_cat = {
      cat = { "tools.search", "tools.debug" },
      default = true,
    },
    dep_of = "telescope.nvim",
  },
  {
    "telescope-manix",
    for_cat = {
      cat = { "tools.search", "languages.nix" },
      default = true,
    },
    dep_of = "telescope.nvim",
  },
}
