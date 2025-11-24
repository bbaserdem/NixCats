-- <nixCats>/lua/keymapConf/code.lua
-- <Leader>c: Code formatting and linting

local lint_status, lint = pcall(require, "lint")
if lint_status then
  vim.keymap.set("n", "<Leader>cl", lint.try_lint, { desc = "Use linter" })
end

local conform_status, conform = pcall(require, "conform")
if conform_status then
  -- Do closure for customizing arguments
  local conf = function()
    conform.format({})
  end
  vim.keymap.set("n", "<Leader>cc", conf, { desc = "Format code (conform)" })
end
