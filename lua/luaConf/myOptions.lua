-- <nixCats>/lua/luaConf/myOptions.lua

-- Needs to be setup before everything, leader key
vim.api.nvim_set_keymap("", " ", "", { noremap = true })
vim.api.nvim_set_keymap("", "<C-S-Space>", "", { noremap = true })
vim.g.mapleader = " "
vim.g.maplocalleader = "<C-S-Space>"

-- Copy pasting in wayland
if os.getenv("WAYLAND_DISPLAY") and vim.fn.exepath("wl-copy") ~= "" then
  vim.g.clipboard = {
    name = "wl-clipboard",
    copy = {
      ["+"] = "wl-copy",
      ["*"] = "wl-copy",
    },
    paste = {
      ["+"] = "wl-paste",
      ["*"] = "wl-paste",
    },
    cache_enabled = 1,
  }
end

-- Display some whitespace characters
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}

-- Search options
vim.opt.hlsearch = true
vim.opt.inccommand = "split" -- Substitutions are previewed live
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Rendering options
vim.opt.fileencoding = "utf-8"
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5 -- If no wrap, keep this many lines off cursor
vim.opt.colorcolumn = "80" -- Set demarkation at 80 lines
vim.opt.wrap = false -- Don't wrap long lines
vim.opt.linebreak = true -- If wrap, then don't split words
vim.opt.conceallevel = 1 -- Plugins need this
vim.opt.lazyredraw = false
vim.opt.updatetime = 300
vim.opt.timeoutlen = 2000 -- Need the timeout
vim.opt.guifont = "Iosevka"

-- Columns and rows
vim.opt.number = true -- Line numbers
vim.opt.relativenumber = false -- Show relative numbers
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.numberwidth = 3 -- Number column width
vim.opt.cmdheight = 2 -- Number column width
vim.opt.pumheight = 10 -- Number column width
vim.opt.showtabline = 2 -- Show the top tabline even with a single tab

-- Navigation
vim.opt.mouse = "a"
vim.opt.whichwrap:append("<>[]") -- Allow traversing up/down from l/r movement

-- Indentation
vim.opt.expandtab = true -- whether to turn tabs into spaces or not
vim.opt.smartindent = false -- smart autoindenting for C programs
vim.opt.shiftwidth = 4 -- default # of spaces for auto-indent step
vim.opt.tabstop = 4 -- # of spaces to render for actual tabs
vim.opt.softtabstop = 4 -- # of spaces to enter instead of tab in edit
vim.opt.autoindent = true -- match indent of next line to prev line
vim.opt.breakindent = true -- wrapped lines keep indent
vim.opt.cpoptions:append("I") -- Don't delete new indent if cursor is moved
vim.opt.showmatch = true -- Show matching brackets when cursor is over them

-- Behavior
vim.opt.completeopt = { "menu", "preview", "noselect" }
vim.opt.title = false -- Don't show title
vim.opt.showmode = false -- Don't show mode
vim.opt.termguicolors = true -- set term gui colors
vim.opt.mat = 2 -- Blink period on matching brackets
vim.opt.cursorline = false -- Disable line highlight
vim.opt.cursorcolumn = false -- Disable column highlight
vim.opt.splitbelow = true -- Force split direction
vim.opt.splitright = true
vim.opt.swapfile = true -- Keep swap files
vim.opt.undofile = true -- Keep undo history
vim.opt.backup = false -- Keep a backup of files
vim.opt.writebackup = true -- First write to backup before writing file
vim.opt.spelllang = { "en", "tr" }
if require("nixCatsUtils").getCatOrDefault("extra.spelling", true) then
  vim.opt.spell = true -- Turn on spellchecking
else
  vim.opt.spell = false -- Turn on spellchecking
end
vim.opt.sessionoptions = "blank,buffers,folds,globals,help,localoptions,options,sesdir,tabpages,terminal,winsize"
