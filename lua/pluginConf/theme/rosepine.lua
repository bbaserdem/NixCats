-- <nixCats>/lua/pluginConf/theme/rosepine.lua
-- Rose pine for nvim

return {
	"rose-pine.nvim",
	for_cat = {
		cat = "theme",
		default = true,
	},
	in_extra = {
		key = "colorscheme.name",
		value = "rose-pine",
	},
	colorscheme = {
		"rose-pine-dawn",
		"rose-pine-main",
		"rose-pine-moon",
		"rose-pine",
	},
	after = function(plugin)
		local _trans = false
		local _style = "main"
		-- If nixCats, check to set the background hue

		if require("nixCatsUtils").isNixCats then
			if nixCats.extra("colorscheme.name") == "rose-pine" then
				if nixCats.extra("colorscheme.style") ~= nil then
					_style = nixCats.extra("colorscheme.style")
				end
				if nixCats.extra("colorscheme.translucent") ~= nil then
					_trans = nixCats.extra("colorscheme.translucent")
				end
			end
		end

		-- Load us
		require("rose-pine").setup({
			variant = _style,
			styles = {
				transparent = _trans,
			},
		})
	end,
}
