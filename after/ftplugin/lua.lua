-------------------------------------------------
-- Lua files behavior
-------------------------------------------------

-- Enable lua lsp
if require("nixCatsUtils").getExtraOrDefault("weAreOld", false) ~= true then
  vim.lsp.enable("lua_ls")
end
