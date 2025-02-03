--[[
-- NIX CATS config entry
--]]

-- Make sure to let nvim know if launched from nix or not
-- This is loading from lua/nixCatsUtils folder
require('nixCatsUtils').setup {
  non_nix_value = true,
}

-- This lets paq-nvim manage plugins if not managed through nix
require('luaConf.non_nix_download')

-- Main entry for config files is lua/luaConf/init.lua
require('luaConf')
