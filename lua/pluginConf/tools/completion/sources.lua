-- <nixCats>/lua/pluginConf/tools/completion/sources.lua
-- Nvim-cmp sources

-- Function needed because packadd doesn't load after direcotories
local function faster_get_path(name)
  local path = vim.tbl_get(package.loaded, "nixCats", "pawsible", "allPlugins", "opt", name)
  if path then
    vim.cmd.packadd(name)
    return path
  end
  return nil -- nil will make it default to normal behavior
end
local load_w_after_plugin = require("lzextras").make_load_with_afters({ "plugin" }, faster_get_path)

return {
  -- Completion engines
  {
    "cmp_luasnip",
    for_cat = { cat = "tools.completion", default = true },
    on_plugin = { "nvim-cmp" },
    load = load_w_after_plugin,
  },
  {
    "cmp-nvim-lsp",
    for_cat = { cat = "tools.completion", default = true },
    on_plugin = { "nvim-cmp" },
    load = load_w_after_plugin,
  },
  {
    "cmp-nvim-lsp-signature-help",
    for_cat = { cat = "tools.completion", default = true },
    on_plugin = { "nvim-cmp" },
    load = load_w_after_plugin,
  },
  {
    "cmp-buffer",
    for_cat = { cat = "tools.completion", default = true },
    on_plugin = { "nvim-cmp" },
    load = load_w_after_plugin,
  },
  {
    "cmp-cmdline",
    for_cat = { cat = "tools.completion", default = true },
    on_plugin = { "nvim-cmp" },
    load = load_w_after_plugin,
  },
  {
    "cmp-cmdline-history",
    for_cat = { cat = "tools.completion", default = true },
    on_plugin = { "nvim-cmp" },
    load = load_w_after_plugin,
  },
  {
    "cmp-spell",
    for_cat = { cat = "tools.completion", default = true },
    on_plugin = { "nvim-cmp" },
    load = load_w_after_plugin,
  },
  {
    "cmp-async-path",
    for_cat = { cat = "tools.completion", default = true },
    on_plugin = { "nvim-cmp" },
    load = load_w_after_plugin,
  },
  {
    "cmp-vimtex",
    for_cat = {
      cat = { "tools.completion" },
      default = true,
    },
    on_plugin = { "nvim-cmp", "blink.cmp" },
    load = load_w_after_plugin,
  },
  {
    "cmp-rg",
    for_cat = { cat = "tools.completion", default = true },
    on_plugin = { "nvim-cmp" },
    load = load_w_after_plugin,
  },
  {
    "cmp-dap",
    for_cat = { cat = "tools.completion", default = true },
    on_plugin = { "nvim-cmp" },
    load = load_w_after_plugin,
  },
}
