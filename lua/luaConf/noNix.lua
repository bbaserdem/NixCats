-- Include the required plugin list for Pckr.nvim to download
require('nixCatsUtils.catPaq').setup({
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
  { "BirdeeHub/lze", },
  { 'joshdick/onedark.vim', },
  { 'nvim-tree/nvim-web-devicons', },
  { 'nvim-lua/plenary.nvim', },
  { 'tpope/vim-repeat', },
  { 'rcarriga/nvim-notify', },

  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', opt = true, },
  { 'nvim-treesitter/nvim-treesitter-context', opt = true, },
  { 'nvim-treesitter/nvim-treesitter-refactor', opt = true, },
  { 'nvim-treesitter/nvim-treesitter-textobjects', opt = true, },

  { 'nvim-telescope/telescope-fzf-native.nvim', build = ':!which make && make', opt = true, },
  { 'nvim-telescope/telescope-ui-select.nvim', opt = true, },
  {'nvim-telescope/telescope.nvim', opt = true, },

  -- lsp
  { 'williamboman/mason.nvim', opt = true, },
  { 'williamboman/mason-lspconfig.nvim', opt = true, },
  { 'j-hui/fidget.nvim', opt = true, },
  { 'neovim/nvim-lspconfig', opt = true, },

  --  NOTE:  we take care of lazy loading elsewhere in an autocommand
    -- so that we can use the same code on and off nix.
    -- so here we just tell it not to auto load it
  { 'folke/lazydev.nvim', opt = true, },

  -- completion
  { 'onsails/lspkind.nvim', opt = true, },
  { 'L3MON4D3/LuaSnip', opt = true, as = 'luasnip', },
  { 'saadparwaiz1/cmp_luasnip', opt = true, },
  { 'hrsh7th/cmp-nvim-lsp', opt = true, },
  { 'hrsh7th/cmp-nvim-lua', opt = true, },
  { 'hrsh7th/cmp-nvim-lsp-signature-help', opt = true, },
  { 'rafamadriz/friendly-snippets', opt = true, },
  { 'hrsh7th/cmp-buffer', opt = true, },
  { 'hrsh7th/cmp-cmdline', opt = true, },
  { 'dmitmel/cmp-cmdline-history', opt = true, },
  { 'hrsh7th/nvim-cmp', opt = true, },

  -- lint and format
  { 'mfussenegger/nvim-lint', opt = true, },
  { 'stevearc/conform.nvim', opt = true, },

  -- dap
  { 'nvim-neotest/nvim-nio', opt = true, },
  { 'rcarriga/nvim-dap-ui', opt = true, },
  { 'theHamsta/nvim-dap-virtual-text', opt = true, },
  { 'jay-babu/mason-nvim-dap.nvim', opt = true, },
  { 'mfussenegger/nvim-dap', opt = true, },

  -- { 'm-demare/hlargs.nvim', },
  { 'mbbill/undotree', opt = true, },
  { 'tpope/vim-fugitive', opt = true, },
  { 'tpope/vim-rhubarb', opt = true, },
  { 'folke/which-key.nvim', opt = true, },
  { 'lewis6991/gitsigns.nvim', opt = true, },
  { 'nvim-lualine/lualine.nvim', opt = true, },
  { 'lukas-reineke/indent-blankline.nvim', opt = true, },
  { 'numToStr/Comment.nvim', opt = true, as = 'comment.nvim', },
  { 'kylechui/nvim-surround', opt = true, },
  { 'iamcco/markdown-preview.nvim',
    build = ':call mkdp#util#install()',
    opt = true,
  },

  -- Organize these later
  { 'jghauser/mkdir.nvim', },
  { 'famiu/bufdelete.nvim', },
  { 'petertriho/nvim-scrollbar', },
  { 'nvim-tree/nvim-tree.lua', },
  { 'catppuccin/nvim', },
  { 'axieax/urlview.nvim', opt = true, },
  { 'folke/trouble.nvim', opt = true, },
  { 'stevearc/aerial.nvim', opt = true, },
  { 'stevearc/conform.nvim', opt = true, },
  { 'dstein65/vim-startuptime', opt = true, },
  { 'folke/zen-mode.nvim', opt = true, },
  { 'folke/twilight.nvim', opt = true, },
  { 'akinsho/toggleterm.nvim', opt = true, },
  { 'f3fora/cmp-spell', },
  { url = 'https://codeberg.org/FelipeLema/cmp-async-path.git', },
  { 'micangl/cmp-vimtex', opt = true, },
  { 'lukas-reineke/indent-blankline.nvim', },
  { 'lervag/vimtex', opt = true, },
  { 'jbyuki/nabla.nvim', opt = true, },
  { 'jakewvincent/mkdnflow.nvim', opt = true, },
  { 'ellisonleao/glow.nvim', opt = true, },


})
