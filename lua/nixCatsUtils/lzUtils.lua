--[[
  This directory is the luaUtils template.
  You can choose what things from it that you would like to use.
  And then delete the rest.
  Everything in this directory is optional.
--]]

local M = {}

-- NOTE: This has been modified from the example repo
-- A nixCats specific lze handler that you can use to conditionally enable by category easier.
-- at the start of your config, register with
-- require('lze').register_handlers(require('nixCatsUtils.lzUtils').for_cat)
-- before any calls to require('lze').load using the handler have been made.
-- accepts:
-- for_cat = { "your" "cat" };
-- for_cat = "your.cat";
-- for_cat = { cat = "your.cat", default = bool }
-- for_cat = { cat = { "your.cat1", "your.cat2" }, default = bool }
-- where default is an alternate value for when nixCats was NOT used to install the config
M.for_cat = {
  spec_field = "for_cat",
  set_lazy = false,
  modify = function(plugin)
    if type(plugin.for_cat) == "table" then
      if plugin.for_cat.cat ~= nil then
        if vim.g[ [[nixCats-special-rtp-entry-nixCats]] ] ~= nil then
          -- Check if we are a table, and run for every element in the table
          -- until one hits.
          if type(plugin.for_cat.cat) == "table" then
            for _, cat_name in ipairs(plugin.for_cat.cat) do
              plugin.enabled = (nixCats(cat_name) and true) or false
              if plugin.enabled then
                break
              end
            end
          -- Compare once if we are not a table
          else
            plugin.enabled = (nixCats(plugin.for_cat.cat) and true) or false
          end
        else
          plugin.enabled = nixCats(plugin.for_cat.default)
        end
      elseif type(plugin.for_cat) == "string" then
        plugin.enabled = (nixCats(plugin.for_cat) and true) or false
      end
    else
      plugin.enabled = (nixCats(plugin.for_cat) and true) or false
    end
    return plugin
  end,
}

-- Check the nixCats.extra table for a matching key/value pair
-- This is to turn this value on if it's off
-- Expects a table with { key = "key.subkey", value = "this_val", }
M.in_extra = {
  spec_field = "in_extra",
  set_lazy = false,
  modify = function(plugin)
    if type(plugin.in_extra) == "table" then
      if
        (plugin.enabled == false)
        and (vim.g[ [[nixCats-special-rtp-entry-nixCats]] ] ~= nil)
        and (type(plugin.in_extra.key) == "string")
        -- and (type(plugin.in_extra.value) == "string")
      then
        -- Do oneshot
        if type(plugin.in_extra.value) == "string" then
          plugin.enabled = nixCats.extra(plugin.in_extra.key) == plugin.in_extra.value
        -- Loop if we are given a table
        elseif type(plugin.in_extra.value) == "table" then
          for _, val_string in ipairs(plugin.in_extra.value) do
            plugin.enabled = nixCats.extra(plugin.in_extra.key) == val_string
            if plugin.enabled then
              break
            end
          end
        end
      end
    end
    return plugin
  end,
}

return M
