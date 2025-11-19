-- <nixCats>/lua/pluginConf/tools/completion/cmp.lua
-- Nvim-cmp

-- Function needed because packadd doesn't load after direcotories
local function faster_get_path(name)
  local path = vim.tbl_get(package.loaded, "nixCats", "pawsible", "allPlugins", "opt", name)
  if path then
    vim.cmd.packadd(name)
    return path
  end
  return nil -- nil will make it default to normal behavior
end
local load_w_after_plugin = require("lzextras").make_load_with_afters({ "plugin" }, faster_get_path)

return {
  {
    "lspkind.nvim",
    for_cat = {
      cat = "tools.completion",
      default = true,
    },
    dep_of = { "nvim-cmp" },
  },
  {
    "nvim-cmp",
    for_cat = {
      cat = "tools.completion",
      default = true,
    },
    event = { "DeferredUIEnter" }, -- Load lazily, but always
    on_require = { "cmp" },
    after = function(plugin)
      -- load local libraries
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      -- Configure cmp
      cmp.setup({

        -- Formatting cmp appearance
        formatting = {
          fields = { "menu", "abbr", "kind" },
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "…",
            menu = {
              luasnip = "  ",
              nvim_lsp = "  ",
              nvim_lsp_signature_help = "󰅏  ",
              buffer = "󰊄  ",
              cmdline = "  ",
              cmdline_history = "󰋚  ",
              spell = "  ",
              async_path = "  ",
              vimtex = "  ",
              rg = "  ",
              lazydev = "󰢱  ",
              mkdnflow = "  ",
              dap = "  ",
            },
          }),
        },

        -- Snippet settings
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        -- Completion sources by default
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "async_path" },
          { name = "rg", keyword_length = 3 },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } },
          { name = "spell", option = { keep_all_entries = false } },
        }),

        -- Keybinds
        -- Preset already does:
        --    up/down   : is select prev/next
        --    ctrl p/n  : is select prev/next (starts completion if not here)
        --    ctrl e    : closes autocompletion menu
        --    ctrl y    : autocompletes (without default selection)
        mapping = cmp.mapping.preset.insert({

          -- ctrl-space: Force open completion; toggles docs if already open
          ["<C-Space>"] = cmp.mapping({
            i = function()
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
          }),

          -- ctrl-shift-space: Open snippet only completion;
          ["<C-S-Space>"] = cmp.mapping(function()
            cmp.complete({
              config = {
                sources = {
                  { name = "luasnip" },
                },
              },
            })
          end, { "i", "s" }),

          -- enter: If an entry is selected, confirm. Else, act casual
          ["<CR>"] = cmp.mapping({
            i = function(fallback)
              if cmp.visible() then
                if luasnip.expandable() then
                  luasnip.expand()
                elseif cmp.get_active_entry() then
                  cmp.confirm({
                    select = false,
                    behavior = cmp.ConfirmBehavior.Replace,
                  })
                else
                  fallback()
                end
              else
                fallback()
              end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = function(fallback)
              if cmp.visible() then
                if cmp.get_active_entry() then
                  cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                  fallback()
                end
              else
                fallback()
              end
            end,
          }),

          -- ctrl b/f : scroll the docs (back/forth) if they are visible
          ["<C-b>"] = {
            i = function(fallback)
              if cmp.visible_docs() then
                cmp.scroll_docs(-4)
              else
                fallback()
              end
            end,
          },
          ["<C-f>"] = {
            i = function(fallback)
              if cmp.visible_docs() then
                cmp.scroll_docs(4)
              else
                fallback()
              end
            end,
          },

          -- tab(+shift+ctrl) : Field scrolling, or move fields in luasnip
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end

            -- Choice navigation for luasnip
          end, { "i", "s" }),
          ["<C-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.choice_active() then
              luasnip.change_choice(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.choice_active() then
              luasnip.change_choice(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        -- Some extra settings
        enabled = function()
          -- Enable also in in DAP buffer
          return vim.bo[0].buftype ~= "prompt" or require("cmp_dap").is_dap_buffer()
        end,
        view = {
          entries = "custom",
          selection_order = "near_cursor",
        },
        experimental = {
          ghost_text = true,
        },
      })

      -- Language specific sources
      -- Lua should get lazydev completion
      cmp.setup.filetype("lua", {
        sources = cmp.config.sources({
          { name = "lazydev" },
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "async_path" },
          { name = "luasnip" },
          { name = "rg", keyword_length = 3 },
          { name = "buffer" },
          { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } },
          { name = "spell", option = { keep_all_entries = false } },
        }),
      })

      -- Tex should get vimtex completion
      cmp.setup.filetype({ "tex", "bib", "latex" }, {
        sources = cmp.config.sources({
          { name = "vimtex" },
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "async_path" },
          { name = "luasnip" },
          { name = "rg", keyword_length = 3 },
          { name = "buffer" },
          { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } },
          { name = "spell", option = { keep_all_entries = false } },
        }),
      })

      -- Markdown should get markdown completion
      cmp.setup.filetype({ "markdown", "md", "rmd" }, {
        sources = cmp.config.sources({
          { name = "mkdnflow" },
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "async_path" },
          { name = "luasnip" },
          { name = "rg", keyword_length = 3 },
          { name = "buffer" },
          { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } },
          { name = "spell", option = { keep_all_entries = false } },
        }),
      })

      -- DAP buffers
      cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = cmp.config.sources({
          { name = "dap" },
        }),
      })

      -- Search completion sources
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          {
            name = "nvim_lsp_document_symbol", --[[ , keyword_length = 3  ]]
          },
          { name = "cmdline_history" },
          { name = "buffer" },
        }),
        view = {
          entries = { name = "wildmenu", separator = " 󰇙 " },
        },
      })

      -- Commandline completion sources
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "cmdline" },
          { name = "cmdline_history" },
          { name = "async_path" },
          { name = "buffer" },
        }),
      })
    end,
  },
}
