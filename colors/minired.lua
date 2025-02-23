-- <nixCats>/colors/minired.lua
-- Reddish colorscheme to use in sudoedit

require("mini.base16").setup({
  palette = {
    base00 = "#2a100a",
    base01 = "#463330",
    base02 = "#695754",
    base03 = "#8f7d7b",
    base04 = "#ccbcbc",
    base05 = "#e0d0d0",
    base06 = "#f4e4e4",
    base07 = "#fff9f9",
    base08 = "#fbce6b",
    base09 = "#a57b00",
    base0A = "#009a5b",
    base0B = "#43eeaf",
    base0C = "#cb56a3",
    base0D = "#8adbff",
    base0E = "#ffaef6",
    base0F = "#0089cb",
  },
  use_cterm = {
    base00 = 233,
    base01 = 236,
    base02 = 240,
    base03 = 8,
    base04 = 250,
    base05 = 252,
    base06 = 254,
    base07 = 15,
    base08 = 221,
    base09 = 136,
    base0A = 29,
    base0B = 85,
    base0C = 169,
    base0D = 117,
    base0E = 219,
    base0F = 32,
  },
  plugins = {
    default = false,
  },
})
