-- <nixCats>/lua/pluginConf/lazy/completion/cmp.lua
-- Nvim-cmp

-- Function needed because packadd doesn't load after direcotories
local load_w_after_plugin = require('nixCatsUtils.lzUtils').make_load_with_after({'plugin'})

return {
  -- Completion engines
  {
    'cmp_luasnip',
    for_cat = { cat = 'completion.cmp', default = false, },
    on_plugin = { 'nvim-cmp', },
    load = load_w_after_plugin,
  }, {
    'cmp-nvim-lsp',
    for_cat = { cat = 'completion.cmp', default = false, },
    on_plugin = { 'nvim-cmp', },
    load = load_w_after_plugin,
  }, {
    'cmp-nvim-lsp-signature-help',
    for_cat = { cat = 'completion.cmp', default = false, },
    on_plugin = { 'nvim-cmp', },
    load = load_w_after_plugin,
  }, {
    'cmp-buffer',
    for_cat = { cat = 'completion.cmp', default = false, },
    on_plugin = { 'nvim-cmp', },
    load = load_w_after_plugin,
  }, {
    'cmp-cmdline',
    for_cat = { cat = 'completion.cmp', default = false, },
    on_plugin = { 'nvim-cmp', },
    load = load_w_after_plugin,
  }, {
    'cmp-cmdline-history',
    for_cat = { cat = 'completion.cmp', default = false, },
    on_plugin = { 'nvim-cmp', },
    load = load_w_after_plugin,
  }, {
    'cmp-spell',
    for_cat = { cat = 'completion.cmp', default = false, },
    on_plugin = { 'nvim-cmp', },
    load = load_w_after_plugin,
  }, {
    'cmp-async-path',
    for_cat = { cat = 'completion.cmp', default = false, },
    on_plugin = { 'nvim-cmp', },
    load = load_w_after_plugin,
  }, {
    'cmp-vimtex',
    on_plugin = { 'nvim-cmp', 'blink.cmp', },
    load = load_w_after_plugin,
  }, {
    'cmp-rg',
    for_cat = { cat = 'completion.cmp', default = false, },
    on_plugin = { 'nvim-cmp', },
    load = load_w_after_plugin,
  }, {
    'cmp-dap',
    for_cat = { cat = 'completion.cmp', default = false, },
    on_plugin = { 'nvim-cmp', },
    load = load_w_after_plugin,
  },

  -- Main plugin
  {
    'nvim-cmp',
    for_cat = { cat = 'completion.cmp', default = false, },
    event = { "DeferredUIEnter" },
    on_require = { 'cmp', },
    after = function (plugin)

      -- load local libraries
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      local lspkind = require('lspkind')

      -- Configure cmp
      cmp.setup {

        -- Formatting cmp appearance
        formatting = {
          fields = { 'menu', 'abbr', 'kind', },
          format = lspkind.cmp_format {
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '…',
            menu = {
              luasnip                 = '  [snippet]',
              nvim_lsp                = '  [lsp]',
              nvim_lsp_signature_help = '󰅏  [lsp-sig]',
              buffer                  = '󰊄  [buffer]',
              cmdline                 = '  [cmdline]',
              cmdline_history         = '󰋚  [cmdhist]',
              spell                   = '  [spell]',
              async_path              = '  [path]',
              vimtex                  = '  [vimtex]',
              rg                      = '  [ripgrep]',
              lazydev                 = '󰢱  [lazydev]',
              mkdnflow                = '  [md]',
              dap                     = '  [dap]',
            },
          },
        },

        -- Snippet settings
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        -- Keybinds
        -- Preset already does:
        --    up/down   : is select prev/next
        --    ctrl p/n  : is select prev/next (starts completion if not here)
        --    ctrl e    : closes autocompletion menu
        --    ctrl y    : autocompletes (without default selection)
        mapping = cmp.mapping.preset.insert {
          -- Override behavior to be with default selection
          ['<C-y>'] = {
            i = cmp.confirm({ select = true; }),
          },
          -- ctrl-space: Open completion; toggles docs if already open
          ['<C-Space>'] = {
            i = function ()
              if cmp.visible() then
                if cmp.visible_docs() then
                  cmp.close_docs()
                else
                  cmp.open_docs()
                end
              else
                cmp.complete()
              end
            end,
          },
          -- enter: If an entry is selected, confirm. Else, act casual
          ['<CR>'] = {
            i = function(fallback)
              if cmp.visible() then
                if cmp.get_selected_entry() == nil then
                  fallback()
                else
                  cmp.confirm({
                    select = true,
                    behavior = cmp.ConfirmBehavior.Replace,
                  })
                end
              else
                fallback()
              end
            end,
          },
          -- ctrl b/f : scroll the docs (back/forth) if they are visible
          ['<C-b>'] = {
            i = function(fallback)
              if cmp.visible_docs() then
                cmp.scroll_docs(-4)
              else
                fallback()
              end
            end,
          },
          ['<C-f>'] = {
            i = function(fallback)
              if cmp.visible_docs() then
                cmp.scroll_docs(4)
              else
                fallback()
              end
            end,
          },
          -- tab(+shift) : Snippet field jumping
          ['<Tab>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },

        -- Some extra settings
        enabled = function ()
        -- Enable also in in DAP buffer
          return vim.bo[0].buftype ~= 'prompt' or require('cmp_dap').is_dap_buffer()
        end,
        view = {
          entries = 'custom',
          selection_order = 'near_cursor',
        },
        experimental = {
          ghost_text = true,
        },

        -- Completion sources by default
        sources = cmp.config.sources {
          { name = 'nvim_lsp', },
          { name = 'nvim_lsp_signature_help', },
          { name = 'async_path', },
          { name = 'luasnip', },
          { name = 'rg', keyword_length = 3, },
          { name = 'buffer', },
          { name = 'cmdline', option = { ignore_cmds = { 'Man', '!', }, }, },
          { name = 'spell', option = { keep_all_entries = false, }, },
        },
      }
      -- Language specific sources
      -- Lua should get lazydev completion
      cmp.setup.filetype('lua', {
        sources = cmp.config.sources {
          { name = 'lazydev', },
          { name = 'nvim_lsp', },
          { name = 'nvim_lsp_signature_help', },
          { name = 'async_path', },
          { name = 'luasnip', },
          { name = 'rg', keyword_length = 3, },
          { name = 'buffer', },
          { name = 'cmdline', option = { ignore_cmds = { 'Man', '!', }, }, },
          { name = 'spell', option = { keep_all_entries = false, }, },
        },
      })
      -- Tex should get vimtex completion
      cmp.setup.filetype({'tex', 'bib', 'latex'}, {
        sources = cmp.config.sources {
          { name = 'vimtex', },
          { name = 'nvim_lsp', },
          { name = 'nvim_lsp_signature_help', },
          { name = 'async_path', },
          { name = 'luasnip', },
          { name = 'rg', keyword_length = 3, },
          { name = 'buffer', },
          { name = 'cmdline', option = { ignore_cmds = { 'Man', '!', }, }, },
          { name = 'spell', option = { keep_all_entries = false, }, },
        },
      })
      -- Tex should get vimtex completion
      cmp.setup.filetype({'markdown', 'md', 'rmd', }, {
        sources = cmp.config.sources {
          { name = 'mkdnflow', },
          { name = 'nvim_lsp', },
          { name = 'nvim_lsp_signature_help', },
          { name = 'async_path', },
          { name = 'luasnip', },
          { name = 'rg', keyword_length = 3, },
          { name = 'buffer', },
          { name = 'cmdline', option = { ignore_cmds = { 'Man', '!', }, }, },
          { name = 'spell', option = { keep_all_entries = false, }, },
        },
      })
      -- DAP buffer
      cmp.setup.filetype({'dap-repl', 'dapui_watches', 'dapui_hover', }, {
        sources = cmp.config.sources {
          { name = 'dap', },
        },
      })

      -- Command line sources
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources {
          { name = 'nvim_lsp_document_symbol', --[[ , keyword_length = 3  ]]},
          { name = 'cmdline_history', },
          { name = 'buffer', },
        },
        view = {
          entries = { name = 'wildmenu', separator = ' 󰇙 ' },
        },
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources {
          { name = 'cmdline', },
          { name = 'cmdline_history', },
          { name = 'async_path', },
        },
      })

    end,
  },
}
