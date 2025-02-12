-- <nixCats>/lua/pluginConf/lazy/conform.lua
-- Code formatter config

return {
  'conform.nvim',
  for_cat = {
    cat = 'functionality',
    default = true,
  },
  event = { 'BufWritePre', },
  cmd = { 'ConformInfo', },
  on_require = { 'conform', },
  after = function(plugin)
    require('conform').setup({
      formatters_by_ft = {
        lua = { 'stylua', },
        python = { 'ruff_organize_imports', 'ruff_format', },
        nix = { 'alejandra', },
        bib = { 'bibtex-tidy', },
        c = { 'clang-format', },
        markdown = { 'mdformat', },
        tex = { 'tex-fmt', },
      },
      default_format_opts = {
        lsp_format = 'fallback',
      },
    })
  end,
}
