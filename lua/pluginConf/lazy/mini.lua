-- <nixCats>/lua/pluginConf/lazy/mini.lua
-- Mini.nvim entry point config

return {
  'mini.nvim',
  for_cat = {
    cat = 'functionality',
    default = true,
  },
  on_plugin = { 'nvim-treesitter', },
  event = { 'DeferredUIEnter' },
  after = function(plugin)
    -- Require setup all the modules
    -- Improve behavior of a and i keys
    require('mini.ai').setup()
    -- Align toolkit
    require('mini.align').setup()
    -- Comment lines
    require('mini.comment').setup()
    -- Move selection or line
    require('mini.move').setup()
    -- Evaluate, sort and exchange text regions 
    require('mini.operators').setup()
    -- Automatically insert paranthesis pairs
    require('mini.pairs').setup()
    -- Split and join arguments to functions
    require('mini.splitjoin').setup()
    -- Surround actions
    require('mini.surround').setup()
    -- Basic settings
    require('mini.basics').setup({
      options = false,
      mappings = {
        basic = false,
        option_toggle_prefix = '',
        windows = true,
        move_with_alt = true,
      },
      autocommands = true,
    })
    -- Move with square brackets
    require('mini.bracketed').setup()
    -- Which key
    require('mini.clue').setup()
    -- Jump to character
    require('mini.jump').setup()
    -- Highlight word under cursor
    require('mini.cursorword').setup()
    -- Highlight certain stuff
    require('mini.hipatterns').setup({
      highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
        todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
        note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
      },
    })
    -- Icons for file types
    require('mini.icons').setup()
    -- Scrollbar and text overview
    require('mini.map').setup({
      integrations = nil,
    })
  end,
}
