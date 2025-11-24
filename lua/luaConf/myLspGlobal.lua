-- <nixCats>/lua/luaConf/myLspGlobal.lua
-- Global LSP configuration

-- Diagnostic signs
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = "󰌵 ",
    },
  },
})

-- Root directory detection
vim.lsp.config("*", {
  root_markers = { ".git" },
})

-- Enabled LSP's
vim.lsp.enable({
  "lua_ls",
  "ltex_plus",
  "nixd",
  "ty",
  "ts_ls",
  "gopls",
  "rust_analyzer",
})
