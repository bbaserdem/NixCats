-- <nixCats>/lua/pluginConf/theme/kanagawa.lua
-- Kanagawa for nvim

return {
	"kanagawa.nvim",
	for_cat = {
		cat = "theme",
		default = true,
	},
	in_extra = {
		key = "colorscheme.name",
		value = "kanagawa",
	},
	colorscheme = {
		"kanagawa-dragon",
		"kanagawa-lotus",
		"kanagawa-wave",
		"kanagawa",
	},
	after = function(plugin)
		local _trans = false
		local _style = "wave"
		-- If nixCats, check to set the background hue

		if require("nixCatsUtils").isNixCats then
			if nixCats.extra("colorscheme.name") == "kanagawa" then
				if nixCats.extra("colorscheme.style") ~= nil then
					_style = nixCats.extra("colorscheme.style")
				end
				if nixCats.extra("colorscheme.translucent") ~= nil then
					_trans = nixCats.extra("colorscheme.translucent")
				end
			end
		end

		-- Load us
		require("kanagawa").setup({
			transparent = _trans,
			theme = _style,
		})
	end,
}
