-- <nixCats>/lua/pluginConf/theme/vscode.lua
-- VSCode theme for nvim

return {
	"vscode.nvim",
	for_cat = {
		cat = "theme",
		default = true,
	},
	in_extra = {
		key = "colorscheme.name",
		value = "vscode",
	},
	colorscheme = {
		"vscode",
	},
	after = function(plugin)
		local _trans = false

		if require("nixCatsUtils").isNixCats then
			if nixCats.extra("colorscheme.name") == "vscode" then
				if nixCats.extra("colorscheme.style") == "light" then
					vim.o.background = "light"
				else
					vim.o.background = "dark"
				end
				if nixCats.extra("colorscheme.translucent") ~= nil then
					_trans = nixCats.extra("colorscheme.translucent")
				end
			end
		end

		-- Load us
		require("vscode").setup({
			transparent = _trans,
		})
	end,
}
