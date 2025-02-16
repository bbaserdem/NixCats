-- <nixCats>/lua/ltex_ls_plus.lua
-- Lua Language Server configuration

vim.lsp.config('ltex_ls_plus', {
  cmd = { "ltex-ls-plus" },
  filetypes = {
    'bib',
    'context',
    'gitcommit',
    'markdown',
    'pandoc',
    'plaintex',
    'mail',
    'rmd',
    'tex',
    'text',
  },
  settings = {
    ltex = {
      language = "en-US",
    },
  },
})
