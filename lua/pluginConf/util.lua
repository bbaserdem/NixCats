-- <nixCats>/lua/pluginConf/util.lua
-- Utility functions

return {
	{ -- Library plugins
		"plenary.nvim",
		for_cat = {
			cat = "main",
			default = true,
		},
		dep_of = {
			"mkdnflow.nvim",
			"obsidian.nvim",
			"telescope.nvim",
		},
		on_require = { "plenary" },
	},
	{ -- Make dir when saving
		"mkdir.nvim",
		for_cat = {
			cat = "functionality",
			default = true,
		},
		event = { "BufWritePre" },
	},
}
