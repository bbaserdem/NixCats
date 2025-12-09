-- <nixCats>/lua/luaConf/myColorscheme.lua
-- Set up the color scheme

local cs = ""

if not require("nixCatsUtils").isNixCats then
  -- Default colorscheme if we are not nixCats
  cs = "melange"

-- Load and do a bit of parsing if we are in nixCats
else
  -- Load variable, default to dark colorscheme
  cs = nixCats.extra("colorscheme.dark")

  -- If not configured, just use the minicyan theme
  if (cs == "") or (cs == nil) or not cs then
    cs = "minicyan"
  end
end

-- Load the specific colorscheme
vim.cmd.colorscheme(cs)
