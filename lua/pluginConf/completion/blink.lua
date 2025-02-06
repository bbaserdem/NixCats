-- <nixCats>/lua/pluginConf/completion/blink.lua
-- Blink autocompletion configuration

return {
  -- Completion engines
  {
    'blink-ripgrep-nvim',
    for_cat = 'completion.blink',
    on_plugin = { 'blink-cmp', },
  }, {
    'blink-emoji-nvim',
    for_cat = 'completion.blink',
    on_plugin = { 'blink-cmp', },
  }, {
    'blink-cmp-spell',
    for_cat = 'completion.blink',
    on_plugin = { 'blink-cmp', },
  }, {
    'blink-compat',
    for_cat = 'completion.blink',
    on_plugin = { 'blink-cmp', },
  },
  -- Main plugin
  {
    'blink.cmp',
    for_cat = 'completion.blink',
    event = { "DeferredUIEnter" },
    on_require = { 'blink', },
    after = function (plugin)
      local bl = require('blink.cmp')
      bl.setup {
        -- General completion settings
        completion  = {
          keyword = { range = 'full', },
          trigger = {
            show_on_keyword = true,
            show_on_trigger_character = true,
            show_on_insert_on_trigger_character = true,
          },
          list = {
            selection = {
              preselect = true,
              auto_insert = true,
            },
          },
          accept = { auto_brackets = { enabled = false, }, },
          menu = {
            auto_show = true,
          },
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
            treesitter_highlighting = false,
          },
          ghost_text = { enabled = true, },
        },
        -- Keymap
        keymap = {

        },
        -- Completion sources
        sources = {
          default = {
            'lsp',
            'path',
            'snippets',
            'buffer',
            'ripgrep',
            'emoji',
          },
          providers = {
            path = {
              async = true,
            },
            ripgrep = {
              module = 'blink-ripgrep',
              name = 'Ripgrep',
              opts = {
                prefix_min_len = 3,
                context_size = 4,
                max_filesize = '1M',
                project_root_marker = {
                  '.git',
                  'flake.lock',
                  'uv.lock',
                },
              },
            },
            emoji = {
              module = 'blink-emoji',
              name = 'Emoji',
              score_offset = 15,
              opts = {
                insert = true,
              },
            },
          },
        },
        -- Snippets
        snippets = { preset = 'luasnip', },
        -- Signature help
        signature = { enabled = true, },
      }
    end,
  },
}
