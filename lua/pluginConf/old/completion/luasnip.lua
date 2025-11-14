-- <nixCats>/lua/pluginConf/completion/luasnip.lua
-- Luasnip config

-- Loading tables, and letting handlers deal with categories
return {
  {
    'friendly-snippets',
    for_cat = 'completion.snippets.luasnip',
    dep_of = {
      'blink.cmp',
      'nvim-cmp',
    },
  }, {
    'luasnip',
    for_cat = 'completion.snippets.luasnip',
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
