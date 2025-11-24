-- <nixCats>/lua/keymapConf/code.lua
-- <Leader>c: Code formatting and linting

local lint_status, lint = pcall(require, "lint")
if lint_status then
  vim.keymap.set("n", "<Leader>cl", lint.try_lint, { desc = "Use [l]inter" })
end

local conform_status, conform = pcall(require, "conform")
if conform_status then
  -- Do closure for customizing arguments
  local conf = function()
    conform.format({})
  end
  vim.keymap.set("n", "<Leader>cf", conf, { desc = "[f]ormat code (conform)" })
end

-- Telescope LSP actions
vim.keymap.set("n", "<Leader>cr", "<cmd>Telescope lsp_references<CR>", { desc = "List LSP references for word" })
vim.keymap.set("n", "<Leader>cc", "<cmd>Telescope lsp_incoming_calls<CR>", { desc = "List LSP incoming [c]alls" })
vim.keymap.set("n", "<Leader>cC", "<cmd>Telescope lsp_outgoing_calls<CR>", { desc = "List LSP outgoing [c]alls" })
vim.keymap.set("n", "<Leader>ci", "<cmd>Telescope lsp_implementations<CR>", { desc = "[i]mplementations for word" })
vim.keymap.set("n", "<Leader>cd", "<cmd>Telescope lsp_definitions<CR>", { desc = "[d]efinitions for word" })
vim.keymap.set("n", "<Leader>ct", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "[t]ype definitions for word" })
vim.keymap.set("n", "<Leader>cs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "List LSP buffer [s]ymbols" })
vim.keymap.set("n", "<Leader>cS", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "List LSP workspace [s]ymbols" })
vim.keymap.set(
  "n",
  "<Leader>c<C-S>",
  "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
  { desc = "Dynamically list LSP workspace [s]ymbols" }
)

vim.keymap.set("n", "<Leader>cT", "<cmd>Telescope treesitter<CR>", { desc = "List [T]reesitter queries" })
