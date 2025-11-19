-------------------------------------------------
-- Latex files behavior
-------------------------------------------------
-- Custom tablength; 2
-- Using vim.bo so that these are only established for the buffer
vim.bo.tabstop = 2          -- size of a hard tabstop (ts).
vim.bo.shiftwidth = 2       -- size of an indentation (sw).
vim.bo.softtabstop = 2      -- number of spaces a <Tab> counts for. When 0, feature is off (sts).

-- VSCode like functions
vim.keymap.set("n", "<F7>", "<plug>(vimtex-compile)", { desc = "Start compilation" })
vim.keymap.set("n", "<F19>", "<plug>(vimtex-stop)", { desc = "Stop compilation" })
vim.keymap.set("n", "<F55>", "<plug>(vimtex-stop-all)", { desc = "Stop ALL compilation" })

-- We want the keymaps to not be at <leader>l but at <leader>v
vim.keymap.set("n", "<localleader>vi", "<plug>(vimtex-info)", { desc = "Vimtex info" })
vim.keymap.set("n", "<localleader>vI", "<plug>(vimtex-info-full)", { desc = "Vimtex full info" })
vim.keymap.set("n", "<localleader>vt", "<plug>(vimtex-toc-open)", { desc = "Open Table of Contents" })
vim.keymap.set("n", "<localleader>vT", "<plug>(vimtex-toc-toggle)", { desc = "Toggle Table of Contents" })
vim.keymap.set("n", "<localleader>vv", "<plug>(vimtex-view)", { desc = "View" })
vim.keymap.set("n", "<localleader>ve", "<plug>(vimtex-errors)", { desc = "Errors" })
vim.keymap.set("n", "<localleader>vo", "<plug>(vimtex-errors)", { desc = "Compiler output" })
vim.keymap.set("n", "<localleader>vg", "<plug>(vimtex-status)", { desc = "Status" })
vim.keymap.set("n", "<localleader>vG", "<plug>(vimtex-status-all)", { desc = "All status" })
vim.keymap.set("n", "<localleader>vc", "<plug>(vimtex-clean)", { desc = "Clean" })
vim.keymap.set("n", "<localleader>vC", "<plug>(vimtex-clean-full)", { desc = "Full clean" })
vim.keymap.set("n", "<localleader>vm", "<plug>(vimtex-imaps-list)", { desc = "Imaps list" })
vim.keymap.set("n", "<localleader>vx", "<plug>(vimtex-reload)", { desc = "Reload vimtex" })
vim.keymap.set("n", "<localleader>vs", "<plug>(vimtex-toggle-main)", { desc = "Toggle main" })
vim.keymap.set("n", "dse", "<plug>(vimtex-env-delete)", { desc = "(Vimtex) delete env" })
vim.keymap.set("n", "dsc", "<plug>(vimtex-cmd-delete)", { desc = "(Vimtex) delete command" })
vim.keymap.set("n", "ds$", "<plug>(vimtex-env-delete-math)", { desc = "(Vimtex) delete math" })
vim.keymap.set("n", "cse", "<plug>(vimtex-env-change)", { desc = "(Vimtex) change env" })
vim.keymap.set("n", "csc", "<plug>(vimtex-cmd-change)", { desc = "(Vimtex) change command" })
vim.keymap.set("n", "cs$", "<plug>(vimtex-cmd-change-math)", { desc = "(Vimtex) change math" })
vim.keymap.set("n", "tse", "<plug>(vimtex-env-toggle-star)", { desc = "(Vimtex) toggle star" })
vim.keymap.set("nx", "tsd", "<plug>(vimtex-delim-toggle-modifier)", { desc = "(Vimtex) toggle modifier" })
vim.keymap.set("i", "<F7>", "<plug>(vimtex-cmd-create)", { desc = "(Vimtex) create command" })
vim.keymap.set("i", "]]", "<plug>(vimtex-delim-close)", { desc = "(Vimtex) close delimiter" })
vim.keymap.set("nxo", "ac", "<plug>(vimtex-ac)", )
vim.keymap.set("nxo", "ic", "<plug>(vimtex-ic)", )
vim.keymap.set("nxo", "ad", "<plug>(vimtex-ad)", )
vim.keymap.set("nxo", "id", "<plug>(vimtex-id)", )
vim.keymap.set("nxo", "ae", "<plug>(vimtex-ae)", )
vim.keymap.set("nxo", "ie", "<plug>(vimtex-ie)", )
vim.keymap.set("nxo", "a$", "<plug>(vimtex-a$)", )
vim.keymap.set("nxo", "i$", "<plug>(vimtex-i$)", )
vim.keymap.set("nxo", "%",  "<plug>(vimtex-%)",  )
vim.keymap.set("nxo", "[" + "[", "<plug>(vimtex-[" + "[)", )
vim.keymap.set("nxo", "][", "<plug>(vimtex-][)", )
vim.keymap.set("nxo", "[]", "<plug>(vimtex-[])", )
vim.keymap.set("nxo", "[[", "<plug>(vimtex-[[)", )
