-- <nixCats>/lua/pluginConf/completion/init.lua
-- Plugins config

-- Loading tables, and letting handlers deal with categories
return {
  -- Category things
  -- cmp is loaded first, in case there are plugins enabled from blink compat
  { import = 'pluginConf.completion.luasnip',  },
  { import = 'pluginConf.completion.cmp',      },
  { import = 'pluginConf.completion.blink',    },
}
