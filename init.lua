--[[
-- NIX CATS config entry
--]]

-- This block is to start the profiler if the environ PROF is set
if vim.env.PROF then
  local ok, sp = pcall(require, 'snacks.profiler')
  if ok then
    sp.startup({
      startup = {
        event = 'VimEnter',
      },
    })
  end
end

-- Make sure to let nvim know if launched from nix or not
-- This is loading from lua/nixCatsUtils folder
require('nixCatsUtils').setup {
  non_nix_value = true,
}

-- Main entry for config files is lua/luaConf/init.lua
require('luaConf')
