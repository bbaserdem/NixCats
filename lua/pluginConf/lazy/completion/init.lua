-- <nixCats>/lua/pluginConf/lazy/completion/init.lua
-- Plugins config

-- Loading tables, and letting handlers deal with categories
require('lze').load {
  -- Category things
  -- cmp is loaded first, in case there are plugins enabled from blink compat
  { import = 'pluginConf.lazy.completion.luasnip',  },
  { import = 'pluginConf.lazy.completion.cmp',      },
  { import = 'pluginConf.lazy.completion.blink',    },
}
