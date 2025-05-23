-------------------------------------------------
-- Latex files behavior
-------------------------------------------------

if require("nixCatsUtils").getExtraOrDefault("weAreOld", false) ~= true then
  vim.lsp.enable("ltex_ls_plus")
end

-- F5 renders us in Glow, Shift-F5 toggles markdown rendering
vim.keymap.set("n", "<F5>", "<cmd>Glow<CR>", { desc = "Render markdown in window", buffer = true })
vim.keymap.set("n", "<F17>", "<cmd>RenderMarkdown buf_toggle<CR>", { desc = "Render markdown in page", buffer = true })
-- F6 renders equation, shift-F6 renders all equations
vim.keymap.set("n", "<F6>", require("nabla").popup, { desc = "Render   eqn.", buffer = true })
vim.keymap.set("n", "<F18>", require("nabla").toggle_virt, { desc = "Render all   eqn.", buffer = true })
