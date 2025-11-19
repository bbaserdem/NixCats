-------------------------------------------------
-- C files behavior
-------------------------------------------------
-- Language tab width is 4 spaces

-- Using vim.bo so that these are only established for the buffer
vim.bo.tabstop = 4 -- size of a hard tabstop (ts).
vim.bo.shiftwidth = 4 -- size of an indentation (sw).
vim.bo.softtabstop = 4 -- number of spaces a <Tab> counts for. When 0, feature is off (sts).

-- Disable autoformat
vim.b.disable_autoformat = true
