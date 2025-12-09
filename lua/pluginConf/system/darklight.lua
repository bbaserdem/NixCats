-- <nixCats>/lua/pluginConf/system/darklight.lua
-- Auto switch dark/light mode

return {
  "darklight.nvim",
  for_cat = {
    cat = "system",
    default = true,
  },
  on_require = { "darklight" },
  on_cmd = { "DarkLightSwitch" },
  after = function(plugin)
    -- Switching function
    local set_mode = function(mode)
      -- Default behavior
      vim.api.nvim_set_option_value("background", mode, {})
      -- Also switch theme if defined in nixcats
      if require("nixCatsUtils").isNixCats then
        local cs = nixCats.extra("colorscheme." .. mode)
        if (cs == "") or (cs == nil) or not cs then
          return
        end
        vim.cmd.colorscheme(cs)
      end
    end

    require("darklight").setup({
      mode = "custom",
      -- We will default to non-nvim behavior if nixcats is not enabled
      -- If it is, we will use nixcats variables
      dark_mode_callback = function()
        set_mode("dark")
      end,
      light_mode_callback = function()
        set_mode("light")
      end,
    })
  end,
}
