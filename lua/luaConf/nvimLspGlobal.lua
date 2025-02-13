-- <nixCats>/lua/luaConf/nvimLspGlobal.lua
-- Global LSP configuration

-- Diagnostic signs
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",  { text = " ", texthl = "DiagnosticSignWarn"  })
vim.fn.sign_define("DiagnosticSignInfo",  { text = " ", texthl = "DiagnosticSignInfo"  })
vim.fn.sign_define("DiagnosticSignHint",  { text = "󰌵 ", texthl = "DiagnosticSignHint"  })


-- Root directory detection
vim.lsp.config('*', {
    root_markers = { '.git', },
})
