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

-- VSCode like functions
vim.keymap.set("n", "<F7>", "<plug>(vimtex-compile)", { desc = "Start compilation" })
vim.keymap.set("n", "<F19>", "<plug>(vimtex-stop)", { desc = "Stop compilation" })
vim.keymap.set("n", "<F55>", "<plug>(vimtex-stop-all)", { desc = "Stop ALL compilation" })
