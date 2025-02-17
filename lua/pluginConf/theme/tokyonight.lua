-- <nixCats>/lua/pluginConf/theme/tokyonight.lua
-- Tokyonight for nvim

return {
	"tokyonight.nvim",
	for_cat = {
		cat = "theme",
		default = true,
	},
	in_extra = {
		key = "colorscheme.name",
		value = "tokyonight",
	},
	colorscheme = {
		"tokyonight-day",
		"tokyonight-moon",
		"tokyonight-night",
		"tokyonight-storm",
		"tokyonight",
	},
	after = function(plugin)
		local _style = "night"

		if require("nixCatsUtils").isNixCats then
			if nixCats.extra("colorscheme.name") == "tokyonight" then
				if nixCats.extra("colorscheme.style") ~= nil then
					_style = nixCats.extra("colorscheme.style")
				end
			end
		end

		-- Load us
		require("tokyonight").setup({
			style = _style,
		})
	end,
}
