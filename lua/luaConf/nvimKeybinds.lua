-- <nixCats>/lua/luaConf/nvimKeybinds.lua

-- Some keybinds

-- Buffer navigation
vim.keymap.set("n", "<leader><leader>[", "<cmd>bprev<CR>",
  { desc = 'Previous buffer' })
vim.keymap.set("n", "<leader><leader>]", "<cmd>bnext<CR>",
  { desc = 'Next buffer' })
vim.keymap.set("n", "<leader><leader>l", "<cmd>b#<CR>",
  { desc = 'Last buffer' })
vim.keymap.set("n", "<leader><leader>d", "<cmd>bdelete<CR>",
  { desc = 'delete buffer' })

-- Diagnostics
vim.keymap.set('n', '[d',           vim.diagnostic.goto_prev,
  { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d',           vim.diagnostic.goto_next,
  { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e',    vim.diagnostic.open_float,
  { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q',    vim.diagnostic.setloclist,
  { desc = 'Open diagnostics list' })

-- Copy
vim.keymap.set({'n', 'v', 'x'}, '<leader>y',    '"+y',
  { noremap = true, silent = true, desc = 'Yank to clipboard' })
vim.keymap.set({'n', 'v', 'x'}, '<leader>yy',   '"+yy',
  { noremap = true, silent = true, desc = 'Yank line to clipboard' })
vim.keymap.set({'n', 'v', 'x'}, '<leader>Y',    '"+yy',
  { noremap = true, silent = true, desc = 'Yank line to clipboard' })
-- Paste
vim.keymap.set({'n', 'v', 'x'}, '<leader>p',    '"+p',
  { noremap = true, silent = true, desc = 'Paste from clipboard' })
vim.keymap.set('i',             '<C-p>',        '<C-r><C-p>+',
  { noremap = true, silent = true, desc = 'Paste from clipboard' })
vim.keymap.set('x',             '<leader>P',    '"_dP',
  { noremap = true, silent = true, desc = 'Paste over selection without erasing unnamed register' })
-- Selection
vim.keymap.set({'n', 'v', 'x'}, '<C-a>',        'gg0vG$',
  { noremap = true, silent = true, desc = 'Select all' })
