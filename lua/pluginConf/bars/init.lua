-- <nixCats>/lua/pluginConf/bars/init.lua
-- Status bar related things
-- Tabline from tabby.nvim
-- bufferline from incline.nvim
-- Statusbar from lualine

-- Get colorscheme from nixcats, or default to one

-- Register themeing related plugins to lazyload
require('lze').load {
  { import = 'pluginConf.bars.tabline', },
  { import = 'pluginConf.bars.statusline', },
}
