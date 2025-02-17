-- <nixCats>/lua/pluginConf/mini.lua
-- Mini.nvim entry point config

return {
	"mini.nvim",
	for_cat = {
		cat = "functionality",
		default = true,
	},
	in_extra = {
		key = "colorscheme.name",
		value = "mini",
	},
	on_plugin = { "nvim-treesitter" },
	event = { "DeferredUIEnter" },
	after = function(plugin)
		-- Require setup all the modules
		-- Improve behavior of a and i keys
		require("mini.ai").setup()
		-- Align toolkit
		require("mini.align").setup()
		-- Comment lines
		require("mini.comment").setup()
		-- Move selection or line
		require("mini.move").setup()
		-- Evaluate, sort and exchange text regions
		require("mini.operators").setup()
		-- Automatically insert paranthesis pairs
		require("mini.pairs").setup()
		-- Split and join arguments to functions
		require("mini.splitjoin").setup()
		-- Surround actions
		require("mini.surround").setup()
		-- Basic settings
		require("mini.basics").setup({
			options = {
				basic = true,
				extra_ui = true,
				-- turns syntax on
				win_borders = "bold",
			},
			mappings = {
				basic = true,
				option_toggle_prefix = "\\",
				windows = true,
				move_with_alt = true,
			},
			autocommands = {
				basic = true,
				relnum_in_visual_mode = false,
			},
		})
		-- Move with square brackets
		require("mini.bracketed").setup()
		--[[ Which key
    local miniclue = require('mini.clue')
    miniclue.setup({
      triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },
        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },
        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },
        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },
        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },
        -- Window commands
        { mode = 'n', keys = '<C-w>' },
        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
      },
      clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
      },
    })
    --]]
		-- Jump to character
		require("mini.jump").setup()
		-- Highlight word under cursor
		require("mini.cursorword").setup()
		-- Highlight certain stuff
		local minihp = require("mini.hipatterns")
		minihp.setup({
			highlighters = {
				-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
				-- Highlight hex color strings (`#rrggbb`) using that color
				hex_color = minihp.gen_highlighter.hex_color(),
			},
		})
		-- Icons for file types
		-- require('mini.icons').setup()
		-- Scrollbar and text overview
		require("mini.map").setup({
			integrations = nil,
		})
	end,
}
