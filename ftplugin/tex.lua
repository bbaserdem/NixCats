-------------------------------------------------
-- Latex files behavior
-------------------------------------------------
-- Custom tablength; 2

-- Using vim.bo so that these are only established for the buffer
vim.bo.tabstop = 2 -- size of a hard tabstop (ts).
vim.bo.shiftwidth = 2 -- size of an indentation (sw).
vim.bo.softtabstop = 2 -- number of spaces a <Tab> counts for. When 0, feature is off (sts).

-- Register us to which-key
local wk_status, wk = pcall(require, "which-key")
if wk_status then
  wk.add({ { "<Leader>l", group = "(L)atex functions (vimtex)" } })
end

-- VSCode like functions;
--  F7 toggles vimtex compilation
--  SHIFT + F7 cleans build
vim.keymap.set("n", "<F7>", "<plug>(vimtex-compile)", { desc = "Toggle compilation" })
vim.keymap.set("n", "<F19>", "<plug>(vimtex-clean)", { desc = "Clean build" })
-- F4 does forward search
vim.keymap.set("n", "<F4>", "<plug>(vimtex-view)", { desc = "Compile file", buffer = true })

-- F5 previews latex equation, shift F5 previews them all
vim.keymap.set("n", "<F5>", require("nabla").popup, { desc = "Render   eqn.", buffer = true })
vim.keymap.set("n", "<F17>", require("nabla").toggle_virt, { desc = "Render all   eqn.", buffer = true })

-- F6 renders equation, shift-F6 renders all equations
