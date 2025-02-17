-- <nixCats>/lua/nixlessConf/plugList.lua
-- Configuring nvim to run without nixCats

-- Include the required plugin list for paq-nvim to download
require("nixCatsUtils.catPaq").setup({
	--[[ ------------------------------------------ ]]
	--[[ The way to think of this is, its very      ]]
	--[[ similar to the main nix file for nixCats   ]]
	--[[                                            ]]
	--[[ It can be used to download your plugins,   ]]
	--[[ and it has an opt for optional plugins.    ]]
	--[[                                            ]]
	--[[ We dont want to handle anything about      ]]
	--[[ loading those plugins here, so that we can ]]
	--[[ use the same loading code that we use for  ]]
	--[[ our normal nix-loaded config.              ]]
	--[[ we will do all our loading and configuring ]]
	--[[ elsewhere in our configuration, so that    ]]
	--[[ we dont have to write it twice.            ]]
	--[[ ------------------------------------------ ]]

	-- Non-nix plugins
	{ "williamboman/mason.nvim", opt = true },
	{ "williamboman/mason-lspconfig.nvim", opt = true },
	{ "jay-babu/mason-nvim-dap.nvim", opt = true },

	-- Startup plugins
	-- Main
	{ "BirdeeHub/lze" },
	-- Functionality
	{ "stevearc/oil.nvim" },
	{ "folke/snacks.nvim" },
	-- Theme
	{ "nvim-tree/nvim-web-devicons" },
	-- Languages.latex
	{ "lervag/vimtex" },

	-- Lazy loaded plugins
	-- Main
	{ "nvim-lua/plenary.nvim", opt = true },
	{ "MunifTanjim/nui.nvim", opt = true },
	-- Debug
	{ "nvim-neotest/nvim-nio", opt = true },
	{ "mfussenegger/nvim-dap", opt = true },
	{ "rcarriga/nvim-dap-ui", opt = true },
	{ "theHamsta/nvim-dap-virtual-text", opt = true },
	-- Theme
	{ "onsails/lspkind.nvim", opt = true },
	{ "nvim-lualine/lualine.nvim", opt = true },
	{ "nanozuki/tabby.nvim", opt = true },
	{ "catppuccin/nvim", opt = true },
	{ "scottmckendry/cyberdream.nvim", opt = true },
	{ "f4z3r/gruvbox-material.nvim", opt = true },
	{ "ellisonleao/gruvbox.nvim", opt = true },
	{ "rebelot/kanagawa.nvim", opt = true },
	{ "marko-cerovac/material.nvim", opt = true },
	{ "savq/melange-nvim", opt = true },
	{ "EdenEast/nightfox.nvim", opt = true },
	{ "joshdick/onedark.vim", opt = true },
	{ "rose-pine/neovim", as = "rose-pine.nvim", opt = true },
	{ "folke/tokyonight.nvim", opt = true },
	{ "Mofiqul/vscode.nvim", opt = true },
	-- Status
	{ "stevearc/aerial.nvim", opt = true },
	{ "j-hui/fidget.nvim", opt = true },
	{ "folke/trouble.nvim", opt = true },
	{ "folke/which-key.nvim", opt = true },
	-- Functionality
	{ "stevearc/conform.nvim", opt = true },
	{ "echasnovski/mini.nvim", opt = true },
	{ "jghauser/mkdir.nvim", opt = true },
	{ "nvim-neo-tree/neo-tree.nvim", opt = true },
	{ "3rd/image.nvim", opt = true },
	{ "neovim/nvim-lspconfig", opt = true },
	{ "s1n7ax/nvim-window-picker", opt = true },
	{ "mfussenegger/nvim-lint", opt = true },
	{ "epwalsh/pomo.nvim", opt = true },
	{ "axieax/urlview.nvim", opt = true },
	-- Completion.Blink
	{ "Saghen/blink.cmp", opt = true },
	{ "Saghen/blink.compat", opt = true },
	{ "ribru17/blink-cmp-spell", opt = true },
	{ "moyiz/blink-emoji.nvim", opt = true },
	{ "mikavilpas/blink-ripgrep.nvim", opt = true },
	{ "micangl/cmp-vimtex", opt = true },
	-- Completion.Snippets.luasnip
	{ "L3MON4D3/LuaSnip", opt = true, as = "luasnip" },
	{ "rafamadriz/friendly-snippets", opt = true },
	-- Tools.Treesitter
	{ "nvim-treesitter/nvim-treesitter", opt = true, build = ":TSUpdate" },
	{ "nvim-treesitter/nvim-treesitter-context", opt = true },
	{ "nvim-treesitter/nvim-treesitter-refactor", opt = true },
	{ "nvim-treesitter/nvim-treesitter-textobjects", opt = true },
	-- Tools.Git
	{ "lewis6991/gitsigns.nvim", opt = true },
	{ "tpope/vim-fugitive", opt = true },
	-- Languages.Lua
	{ "folke/lazydev.nvim", opt = true },
	-- Languages.Markdown
	{ "jbyuki/nabla.nvim", opt = true },
	{ "jakewvincent/mkdnflow.nvim", opt = true },
	{ "ellisonleao/glow.nvim", opt = true },
	{ "epwalsh/obsidian.nvim", opt = true },
})
