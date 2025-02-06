-- <nixCats>/lua/luaConf/nvimLspGlobal.lua
-- Global LSP config

-- Load the lspkind plugin to add pictograms
require('lspkind').config({
    mode = 'symbol_text',
    preset = 'default',
})

-- Global LSP configuration
vim.lsp.config('*', {
    root_markers = { '.git', },
})
