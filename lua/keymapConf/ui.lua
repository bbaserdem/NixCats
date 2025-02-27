-- <nixCats>/lua/keymapConf/ui.lua
-- <Leader>u: Visual stuff
local minimap_keymap = require("lzextras").keymap("mini.nvim")
local snacks_keymap = require("lzextras").keymap("snacks.nvim")
local snacks_toggle = require("snacks").toggle

-- Set F2 to open terminal
snacks_keymap.set("n", "<F2>", function()
  require("snacks").terminal.toggle()
end, { desc = "Open terminal" })

-- Fidget status toggles: fF
vim.keymap.set({ "n", "v" }, "<Leader>uf", "<cmd>Fidget suppress<CR>", { desc = "Toggle LSP info (fidget)" })
vim.keymap.set({ "n", "v" }, "<Leader>uF", "<cmd>Fidget history<CR>", { desc = "Show LSP status history (fidget)" })

-- Mason & lsp config: lLp
vim.keymap.set("n", "<Leader>ul", "<cmd>LspInfo<CR>", { desc = "Open LSPconfig menu" })
vim.keymap.set("n", "<Leader>uL", "<cmd>Mason<CR>", { desc = "Open Mason menu" })
vim.keymap.set("n", "<Leader>up", "<cmd>PaqSync<CR>", { desc = "Sync packages (paq)" })

-- Mini Map: mM^m, managed by mini
minimap_keymap.set("n", "<Leader>um", function()
  require("mini.map").toggle()
end, { desc = "Toggle minimap" })
minimap_keymap.set("n", "<Leader>uM", function()
  require("mini.map").open()
  require("mini.map").toggle_focus()
end, { desc = "Focus minimap" })
minimap_keymap.set("n", "<Leader>u<C-m>", function()
  require("mini.map").toggle_side()
end, { desc = "Switch side for minimap" })

-- File browsers tTo
-- Neotree
vim.keymap.set("n", "<Leader>ut", "<cmd>Neotree focus left<CR>", { desc = "Go to Neotree" })
vim.keymap.set("n", "<Leader>uT", "<cmd>Neotree focus float<CR>", { desc = "Floating Neotree" })
vim.keymap.set("n", "<Leader>u<C-T>", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neotree" })
-- Oil
vim.keymap.set("n", "<Leader>uo", "<cmd>Oil<CR>", { desc = "Open Oil" })

-- Snacks toggles aAd<tab>?nhzZ^z
snacks_toggle.animate():map("<Leader>ua")
snacks_toggle.scroll():map("<Leader>uA")
snacks_toggle.diagnostics():map("<Leader>ud")
snacks_toggle.indent():map("<Leader>u<Tab>")
snacks_toggle.inlay_hints():map("<Leader>u?")
snacks_toggle.line_number():map("<Leader>un")
snacks_toggle.treesitter():map("<Leader>uh")
snacks_toggle.dim():map("<Leader>uz")
snacks_toggle.zen():map("<Leader>uZ")
snacks_toggle.zoom():map("<Leader>u<C-z>")
-- Custom dark/light mode toggle
snacks_toggle
  .new({
    name = "Dark mode",
    which_key = true,
    get = function()
      return vim.o.background == "dark"
    end,
    notify = true,
    set = function(state)
      if state then
        vim.o.background = "dark"
      else
        vim.o.background = "light"
      end
    end,
  })
  :map("<Leader>uC")

-- Other snacks related tools
snacks_keymap.set("n", "<Leader>ue", function()
  require("snacks").explorer()
end, { desc = "Open file explorer (snacks)" })
snacks_keymap.set("n", "<Leader>u`", function()
  require("snacks").notifier.show_history()
end, { desc = "Notification search (snacks)" })
snacks_keymap.set("n", "<Leader>uc", function()
  require("snacks").picker.colorschemes()
end, { desc = "Colorschemes" })
