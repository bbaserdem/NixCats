-- <nixCats>/lua/pluginConf/lint.lua
-- Code linter

return {
  "nvim-lint",
  for_cat = {
    cat = "functionality",
    default = true,
  },
  event = { "DeferredUIEnter" },
  on_require = { "lint" },
  after = function(profile)
    require("lint").linters_by_ft = {
      bash = { "bash" },
      dash = { "dash" },
      dotenv = { "dotenv_linter" },
      zsh = { "zsh" },
    }

    -- Create a linting auto command
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
