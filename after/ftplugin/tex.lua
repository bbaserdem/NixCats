-------------------------------------------------
-- Latex files behavior
-------------------------------------------------

if require("nixCatsUtils").getExtraOrDefault("weAreOld", false) ~= true then
  vim.lsp.enable("ltex_ls_plus")
end

-- F5 toggles vimtex compilation, shift-F5 does forward search, ctrl-f5 cleans build
vim.keymap.set("n", "<F5>", "<cmd>VimtexCompile<CR>", { desc = "Compile file", buffer = true })
vim.keymap.set("n", "<F17>", "<cmd>VimtexView<CR>", { desc = "Forward search", buffer = true })
vim.keymap.set("n", "<F29>", "<cmd>VimtexClean<CR>", { desc = "Clean directory", buffer = true })
-- F6 renders equation, shift-F6 renders all equations
vim.keymap.set("n", "<F6>", require("nabla").popup, { desc = "Render   eqn.", buffer = true })
vim.keymap.set("n", "<F18>", require("nabla").toggle_virt, { desc = "Render all   eqn.", buffer = true })
