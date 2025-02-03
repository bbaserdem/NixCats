-- Nvim configuration entry

-- Global settings
require('luaConf.nvimOptions')
require('luaConf.nvimAutocmd')
require('luaConf.nvimKeybinds')

-- Register lze handler with the spec field 'for_cat'
require('lze').register_handlers(require('nixCatsUtils.lzUtils').for_cat)

-- Plugin configurations
require('luaConf.pluginConfigs')

-- LSP configurations
require('luaConf.lspConfigs')

-- Ask nixCats if we are in debug mode
if nixCats('debug') then
  require('luaConf.debug')
end

-- Check if we have linters configured
if nixCats('lint') then
  require('luaConf.lint')
end

-- Check if formatters are configured
if nixCats('format') then
  require('luaConf.format')
end
