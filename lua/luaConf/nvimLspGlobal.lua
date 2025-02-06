-- <nixCats>/lua/luaConf/nvimLspGlobal.lua
-- Global LSP configuration

-- Root directory detection
vim.lsp.config('*', {
    root_markers = { '.git', },
})
