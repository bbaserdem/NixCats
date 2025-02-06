-- <nixCats>/lua/pluginConf/completion/init.lua
-- Plugins config

-- Loading tables, and letting handlers deal with categories
require('lze').load {
    -- Category things
    { import = 'pluginConf.completion.blink', },
}
