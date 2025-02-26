-- <nixCats>/lua/keymapConf/git.lua
-- <Leader>g: Git actions
local gitsigns_keymap = require("lzextras").keymap("gitsigns.nvim")

-- Gitsigns actions
vim.keymap.set("n", "<Leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
vim.keymap.set("n", "<Leader>gS", "<cmd>Gitsigns stage_buffer<CR>", { desc = "Stage buffer" })
gitsigns_keymap.set("v", "<Leader>gs", function()
  require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage selection" })
vim.keymap.set("n", "<Leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
vim.keymap.set("n", "<Leader>gR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "Reset hunk" })
gitsigns_keymap.set("v", "<Leader>gr", function()
  require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset selection" })
vim.keymap.set("n", "<Leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
vim.keymap.set("n", "<Leader>gi", "<cmd>Gitsigns preview_hunk_inline<CR>", { desc = "Inline preview hunk" })
vim.keymap.set("n", "<Leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "Show diff" })
gitsigns_keymap.set("n", "<Leader>gD", function()
  require("gitsigns").diffthis("~")
end, { desc = "Show all diffs" })
vim.keymap.set("n", "<Leader>gq", "<cmd>Gitsigns setqflist<CR>", { desc = "Set qf list for all" })
gitsigns_keymap.set("n", "<Leader>gQ", function()
  require("gitsigns").setqflist("all")
end, { desc = "Set qf list for all" })
vim.keymap.set("n", "<Leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle line blame" })
gitsigns_keymap.set("n", "<Leader>gB", function()
  require("gitsigns").blame_line({ full = true })
end, { desc = "Full blame line" })
vim.keymap.set("n", "<Leader>gw", "<cmd>Gitsigns toggle_word_diff<CR>", { desc = "Toggle word diff" })
vim.keymap.set("n", "<Leader>gx", "<cmd>Gitsigns toggle_deleted<CR>", { desc = "Toggle deleted" })

-- Tree view
vim.keymap.set("n", "<Leader>gt", "<cmd>Neotree focus float git_status<CR>", { desc = "Neotree git files" })

-- Text object
gitsigns_keymap.set({ "o", "x" }, "ih", require("gitsigns").select_hunk, { desc = "Git hunk" })
