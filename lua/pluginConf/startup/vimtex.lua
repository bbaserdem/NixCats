-- <nixCats>/lua/pluginConf/startup/vimtex.lua
-- Vimtex configuration, can't be lazy loaded for inverse search

-- Check if there is a desktop override, and configure this
if require('nixCatsUtils').isNixCats then
  local app = nixCats.extra('latex.pdfViewer')
  if app == 'okular' then
    vim.g.vimtex_view_method = 'okular'
  else
    vim.g.vimtex_view_method = 'zathura'
  end
else
  vim.g.vimtex_view_method = 'zathura'
end

-- Vimscript mappings
vim.g.vimtex_mappings_enabled = 0
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
  aux_dir = 'LatexAux',
}
vim.g.vimtex_compiler_progname = 'nvr'
vim.g.vimtex_quickfix_method = 'pplatex'
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
vim.g.vimtex_quickfix_ignore_filters = {
  'Underfull',
  'Overfull',
  'Float too large',
}
