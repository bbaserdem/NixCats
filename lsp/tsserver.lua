-- <nixCats>/lsp/ts_ls.lua
-- Typescript LSP config

vim.lsp.config.ts_ls = {
  cmd = {
    'typescript-language-server',
    '--stdio',
  },
  root_markers = {
    'tsconfig.json',
    'jsconfig.json',
    'package.json',
  },
}
