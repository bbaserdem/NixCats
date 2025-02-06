-- <nixCats>/lua/lua_ls.lua
-- Lua Language Server configuration

vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    settings = {
        Lua = {
            formatters = {
                ignoreComments = true,
            },
            signatureHelp = { enabled = true },
            diagnostics = {
                globals = { 'nixCats' },
                disable = { 'missing-fields' },
            },
        },
        telemetry = { enabled = false },
    },
})
