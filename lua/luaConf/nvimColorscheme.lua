-- <nixCats>/lua/luaConf/nvimColorscheme.lua
-- Set up the color scheme

local cs = ''

if not require('nixCatsUtils').isNixCats then
  -- Default colorscheme if we are not nixCats
  cs = 'onedark'

-- Load and do a bit of parsing if we are in nixCats
else
  -- Load variable
  cs = nixCats.extra('colorscheme.name')

  -- If not configured, just use the default nvim theme
  if (cs == '') or (cs == nil) or (not cs) then
    cs = 'default'
  end

end
-- Load the specific colorscheme
vim.cmd.colorscheme(cs)
