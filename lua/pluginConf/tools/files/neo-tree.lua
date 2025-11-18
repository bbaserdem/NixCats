-- <nixCats>/lua/pluginConf/tools/files/neo-tree.lua
-- Neo-Tree: Sidebar for files

return {
  {
    "neo-tree.nvim",
    for_cat = {
      cat = "tools.files",
      default = true,
    },
    cmd = "Neotree",
    after = function(plugin)
      require("neo-tree").setup({
        window = {
          mappings = {
            ["P"] = {
              "toggle_preview",
              config = {
                use_float = true,
                use_image_nvim = true,
              },
            },
          },
        },
      })
    end,
  },
  {
    "nvim-lsp-file-operations",
    for_cat = {
      cat = "tools.files",
      default = true,
    },
    dep_of = "neo-tree.nvim",
    after = function(plugin)
      require("lsp-file-operations").setup({})
    end,
  },
  {
    "image.nvim",
    for_cat = {
      cat = "tools.files",
      default = true,
    },
    dep_of = "neo-tree.nvim",
    after = function(plugin)
      require("image").setup({
        backend = "kitty",
        processor = "magick_rock",
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = true,
            download_remote_images = false,
            only_render_image_at_cursor = true,
            only_render_image_at_cursor_mode = "popup",
            floating_windows = true,
            filetypes = { "markdown", "vimwiki" },
          },
        },
      })
    end,
  },
}
