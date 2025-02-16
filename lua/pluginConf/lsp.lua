-- <nixCats>/lua/pluginConf/lsp.lua
-- LSP config for lsp server status

return {
  'nvim-lspconfig',
  for_cat = {
    cat = 'main',
    default = true,
  },
  event = { 'FileType', },
  cmd = {
    'LspInfo',
    'LspStart',
    'LspStop',
    'LspRestart',
  },
  on_require = { 'lspconfig', },
}
