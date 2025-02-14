-- <nixCats>/lua/pluginConf/lazy/bars/init.lua
-- Status bar related things
-- Tabline from tabby.nvim
-- bufferline from incline.nvim
-- Statusbar from lualine

-- Get colorscheme from nixcats, or default to one

-- Register themeing related plugins to lazyload
require('lze').load {
  { import = 'pluginConf.lazy.bars.tabline', },
  { import = 'pluginConf.lazy.bars.statusline', },
}
