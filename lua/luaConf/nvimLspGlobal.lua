-- <nixCats>/lua/luaConf/nvimLspGlobal.lua
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
