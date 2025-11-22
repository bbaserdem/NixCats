-- <nixCats>/lua/keymapConf/ai.lua
-- <Leader>f: AI keymaps

local cc_status, cc = pcall(require, "claudecode")
if cc_status then
  vim.keymap.set("n", "<Leader>a<Space>", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude" })
  vim.keymap.set("n", "<Leader>af", "<cmd>ClaudeCodeFocus<CR>", { desc = "Focus Claude" })
  vim.keymap.set("n", "<Leader>ar", "<cmd>ClaudeCode --resume<CR>", { desc = "Resume Claude" })
  vim.keymap.set("n", "<Leader>ac", "<cmd>ClaudeCode --continue<CR>", { desc = "Continue Claude" })
  vim.keymap.set("n", "<Leader>am", "<cmd>ClaudeCodeSelectModel<CR>", { desc = "Select Claude model" })
  vim.keymap.set("n", "<Leader>ab", "<cmd>ClaudeCodeAdd %<CR>", { desc = "Add current buffer" })
  vim.keymap.set("v", "<Leader>as", "<cmd>ClaudeCodeSend<CR>", { desc = "Send to Claude" })
  vim.keymap.set("n", "<Leader>ad", "<cmd>ClaudeCodeDiffAccept<CR>", { desc = "Accept diff" })
  vim.keymap.set("n", "<Leader>aD", "<cmd>ClaudeCodeDiffDeny<CR>", { desc = "Deny diff" })
  vim.keymap.set("n", "<Leader>as", "<cmd>ClaudeCodeTreeAdd<CR>", {
    desc = "Add file to claude",
    ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
  })
end

local ccf_status, ccf = pcall(require, "claude-fzf.nvim")
if ccf_status then
  vim.keymap.set("n", "<Leader>aF", "<cmd>ClaudeFzfFiles<CR>", { desc = "Claude: add [F]iles" })
  vim.keymap.set("n", "<Leader>a<C-f>", "<cmd>ClaudeFzfGitFiles<CR>", { desc = "Claude: Add Git files" })
  vim.keymap.set("n", "<Leader>ag", "<cmd>ClaudeFzfFiles<CR>", { desc = "Claude: Search (Get) and add files" })
  vim.keymap.set("n", "<Leader>aB", "<cmd>ClaudeFzfBuffers<CR>", { desc = "Claude: Add buffers" })
  vim.keymap.set("n", "<Leader>a<C-d>", "<cmd>ClaudeFzfDirectory<CR>", { desc = "Claude: Add directory" })
end
