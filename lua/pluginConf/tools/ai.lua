-- <nixCats>/lua/pluginConf/tools/ai.lua
-- AI tooling to work with neovim

return {
  { -- Git status signs in the num column
    "fzf-lua",
    for_cat = {
      cat = "tools.ai",
      default = true,
    },
    dep_of = {
      "claude-fzf.nvim",
    },
    on_require = { "fzf-lua" },
    after = function(plugin)
      require("fzf-lua").setup({})
    end,
  },
  { -- Git status signs in the num column
    "claude-fzf.nvim",
    for_cat = {
      cat = "tools.ai",
      default = true,
    },
    on_require = { "claude-fzf" },
    cmd = {
      "ClaudeFzf",
      "ClaudeFzfFiles",
      "ClaudeFzfGrep",
      "ClaudeFzfBuffers",
      "ClaudeFzfGitFiles",
      "ClaudeFzfDirectory",
    },
    after = function(plugin)
      require("claude-fzf").setup({
        batch_size = 10,
      })
    end,
  },
  { -- Git status signs in the num column
    "claudecode.nvim",
    for_cat = {
      cat = "tools.ai",
      default = true,
    },
    on_require = { "claudecode" },
    cmd = {
      "ClaudeCode",
      "ClaudeCodeFocus",
      "ClaudeCodeSelectModel",
      "ClaudeCodeAdd",
      "ClaudeCodeSend",
      "ClaudeCodeTreeAdd",
      "ClaudeCodeDiffAccept",
      "ClaudeCodeDiffDeny",
    },
    after = function(plugin)
      require("claudecode").setup({
        git_repo_cwd = true,
        terminal = {
          -- Need this so snacks terminal doesn't get used
          provider = "native",
        },
      })
    end,
  },
}
