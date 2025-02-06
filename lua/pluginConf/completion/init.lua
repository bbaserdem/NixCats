-- <nixCats>/lua/pluginConf/completion/init.lua
-- Plugins config

-- Loading tables, and letting handlers deal with categories
require('lze').load {
    -- Category things
    { import = 'pluginConf.completion.blink', },
    -- Shared completion sources
    {
        'cmp-vimtex',
        on_plugin = {
            'blink.cmp',
            'nvim-cmp',
        },
    },
    -- Luasnip config
    {
        'friendly-snippets',
        for_cat = 'completion.luasnip',
        on_plugin = { 'LuaSnip', },
    }, {
        'LuaSnip',
        for_cat = 'completion.luasnip',
        on_plugin = {
            'blink.cmp',
            'nvim-cmp',
        },
    }
}
