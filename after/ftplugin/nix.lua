-------------------------------------------------
-- Nix files behavior
-------------------------------------------------

-- Enable nixd
if require("nixCatsUtils").getExtraOrDefault("weAreOld", false) ~= true then
  vim.lsp.enable("nixd")
end
