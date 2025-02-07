-- <nixCats>/lua/pluginConf/completion/init.lua
-- Plugins config

-- Loading tables, and letting handlers deal with categories
require('lze').load {
  -- Category things
  { import = 'pluginConf.completion.blink', },
  { import = 'pluginConf.completion.cmp', },
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
    on_plugin = { 'luasnip', },
  }, {
    'luasnip',
    for_cat = 'completion.luasnip',
    dep_of = {
      'blink.cmp',
      'nvim-cmp',
    },
    after = function (plugin)
      local luasnip = require('luasnip')
      -- Needed for friendly snippets
      require('luasnip.loaders.from_vscode').lazy_load()
      luasnip.config.setup {}
      -- Include custom keycode for choice-nodes
      local ls = require('luasnip')
      vim.keymap.set({ "i", "s" }, "<M-n>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end)
    end,
  },
}
