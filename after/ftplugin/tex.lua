-------------------------------------------------
-- Latex files behavior
-------------------------------------------------

if require("nixCatsUtils").getExtraOrDefault("weAreOld", false) ~= true then
  vim.lsp.enable("ltex_ls_plus")
end
