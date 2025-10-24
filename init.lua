--[[
-- NIX CATS config entry
--]]

-- Make sure to let nvim know if launched from nix or not
-- This is loading from lua/nixCatsUtils folder
require("nixCatsUtils").setup({
  non_nix_value = true,
})

-- Main entry for config files is lua/luaConf/init.lua
require("luaConf")
