-- colors/minired.lua
-- Mini colorscheme
local mini16 = require("mini.base16")
require("mini.base16").setup({
  palette = require("mini.base16").mini_palette(
    "#401603", -- Background
    "#ffa6ce" -- Foreground
  ),
})
