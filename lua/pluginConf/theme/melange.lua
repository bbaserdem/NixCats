-- <nixCats>/lua/pluginConf/theme/melange.lua
-- Melange for nvim 

return {
  'melange-nvim',
  for_cat = {
    cat = 'theme',
    default = true,
  },
  colorscheme = {
    'melange',
  },
  after = function(plugin)

    -- Set background
    if require('nixCatsUtils').isNixCats then
      if nixCats.extra('colorscheme.name') == 'melange' then
        if nixCats.extra('colorscheme.style') == 'light' then
          vim.o.background = 'light'
        else
          vim.o.background = 'dark'
        end
      end
    end

  end,
}
