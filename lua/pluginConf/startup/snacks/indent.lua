-- <nixCats>/lua/pluginConf/startup/snacks/indent.lua
-- Indent config

-- Configuring dashboard
return {
  enabled = true,
  char = '│',
  only_scope = false,
  only_current = false,
  scope = {
    enabled = true,
    priority = 200,
    char = '┇',
    underline = true,
    only_current = false,
    hl = 'SnacksIndentScope',
  },
  chunk = {
    enabled = true,
    only_current = false,
    priority = 200,
    hl = 'SnacksIndentChunk',
    char = {
      corner_top = '┏',
      corner_bottom = '┗',
      horizontal = '━',
      vertical = '┃',
      arrow = '⯈',
    }
  },
}
