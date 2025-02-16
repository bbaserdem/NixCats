-- <nixCats>/lua/pluginConf/theme/onedark.lua
-- onedark for nvim 

return {
  'onedark.nvim',
  for_cat = {
    cat = 'theme',
    default = true,
  },
  colorscheme = {
    'onedark',
  },
  after = function(plugin)
    -- If nixCats, check to set the background hue
    local _style = 'darker'
    local _trans = false

    if require('nixCatsUtils').isNixCats then
      if (nixCats.extra('colorscheme.name') == 'onedark') then
        _style = nixCats.extra('colorscheme.style')
        if (nixCats.extra('colorscheme.translucent') ~= nil) then
          _trans = nixCats.extra('colorscheme.translucent')
        end
      end
    end

    -- Load us
    require('onedark').setup({
      style = _style,
      transparent = _trans,
    })
  end,
}
