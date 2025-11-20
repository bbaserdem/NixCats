-- <nixCats>/lua/keymapConf/git.lua
-- <Leader>g: Git operations

-- Gitsigns
local gs_status, gs = pcall(require, "gitsigns")
if gs_status then
  -- Closures
  local next = function()
    gs.nav_hunk("next")
  end
  local prev = function()
    gs.nav_hunk("prev")
  end
  local blame = function()
    gs.blame_line({ full = true })
  end
  local diff = function()
    gs.diffthis("~")
  end
  local qfix = function()
    gs.setqflist("all")
  end
  -- Keymaps from plugin
  vim.keymap.set("n", "<Leader>gn", next, { desc = "Next hunk" })
  vim.keymap.set("n", "<Leader>gp", prev, { desc = "Previous hunk" })
  vim.keymap.set("n", "<Leader>ga", gs.stage_hunk, { desc = "Stage hunk" })
  vim.keymap.set("n", "<Leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
  vim.keymap.set("n", "<Leader>gA", gs.stage_buffer, { desc = "Stage buffer" })
  vim.keymap.set("n", "<Leader>gR", gs.reset_buffer, { desc = "Reset buffer" })
  vim.keymap.set("n", "<Leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
  vim.keymap.set("n", "<Leader>gi", gs.preview_hunk_inline, { desc = "Preview hunk inline" })
  vim.keymap.set("n", "<Leader>gb", blame, { desc = "Blame line" })
  vim.keymap.set("n", "<Leader>gd", gs.diffthis, { desc = "Diff" })
  vim.keymap.set("n", "<Leader>gD", diff, { desc = "Diff (full document)" })
  vim.keymap.set("n", "<Leader>gk", gs.setqflist, { desc = "Quickfix list" })
  vim.keymap.set("n", "<Leader>gK", qfix, { desc = "All Quickfix list" })
  vim.keymap.set("n", "<Leader>g<C-b>", gs.toggle_current_line_blame, { desc = "Toggle line blame" })
  vim.keymap.set("n", "<Leader>g<C-d>", gs.toggle_word_diff, { desc = "Toggle word diff" })
  -- Text object
  vim.keymap.set({ "o", "x" }, "ih", gs.select_hunk, { desc = "Select hunk" })
end
