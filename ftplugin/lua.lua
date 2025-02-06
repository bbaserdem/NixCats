-------------------------------------------------
-- Lua files behavior
-------------------------------------------------
-- Custom tablength; 2
-- Using vim.bo so that these are only established for the buffer
vim.bo.shiftwidth = 2       -- size of an indentation (sw).
vim.bo.tabstop = 2          -- size of a hard tabstop (ts).
vim.bo.softtabstop = 2      -- number of spaces a <Tab> counts for.

-- Enable lua lsp
vim.lsp.enable('lua_ls')
