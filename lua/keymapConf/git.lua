-- <nixCats>/lua/keymapConf/git.lua
-- <leader>g: Git actions

-- Gitsigns actions
vim.keymap.set("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>", { desc = "Stage buffer" })
vim.keymap.set("v", "<leader>gs", function()
  require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage selection" })
vim.keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "Reset hunk" })
vim.keymap.set("v", "<leader>gr", function()
  require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset selection" })
vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>gi", "<cmd>Gitsigns preview_hunk_inline<CR>", { desc = "Inline preview hunk" })
vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "Show diff" })
vim.keymap.set("n", "<leader>gD", function()
  require("gitsigns").diffthis("~")
end, { desc = "Show all diffs" })
vim.keymap.set("n", "<leader>gq", "<cmd>Gitsigns setqflist<CR>", { desc = "Set qf list for all" })
vim.keymap.set("n", "<leader>gQ", function()
  require("gitsigns").setqflist("all")
end, { desc = "Set qf list for all" })
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle line blame" })
vim.keymap.set("n", "<leader>gB", function()
  require("gitsigns").blame_line({ full = true })
end, { desc = "Full blame line" })
vim.keymap.set("n", "<leader>gw", "<cmd>Gitsigns toggle_word_diff<CR>", { desc = "Toggle word diff" })
vim.keymap.set("n", "<leader>gx", "<cmd>Gitsigns toggle_deleted<CR>", { desc = "Toggle deleted" })

-- Tree view
vim.keymap.set("n", "<leader>gt", "<cmd>Neotree focus float git_status<CR>", { desc = "Neotree git files" })

-- Text object
vim.keymap.set({ "o", "x" }, "ih", require("gitsigns").select_hunk, { desc = "Git hunk" })
