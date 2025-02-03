# The category definitions
{
  pkgs,
  settings,
  categories,
  extra,
  name,
  mkNvimPlugin,
  ...
} @ packageDef: {
  # The way the tree is established is;
  # <category>
  # ├─ debug
  # ├─ general
  # │  ├─ always
  # │  ├─ extra
  # │  ├─ theme
  # │  └─ <specific big plugin like cmp>
  # └─ language
  #    └─ <specific language settings>

  # System level requirements
  # These packages should be available to the nixCat instance
  # Similar to programs.neovim.extraPackages in homeManager
  lspsAndRuntimeDeps = {
    general = with pkgs; {
      always = [
        universal-ctags # Tag generation for multiple languages
        ripgrep # Fast grep implementation
        fd # Fast find implementation
        wl-clipboard # Wayland clipboard communication
        xclip # Xorg clipboard communication
        libnotify # Allows neovim to send notifications to desktop
      ];
    };
    languages = {
      lua = with pkgs; [
        lua-language-server
      ];
      nix = with pkgs; [
        nix-doc
        nixd
      ];
      markdown = with pkgs; [
        glow
      ];
      ts = with pkgs; [
        nodePackages.typescript-language-server
      ];
      latex = with pkgs; [
        pplatex
        neovim-remote
      ];
    };
  };

  # Plugins that need to be operational at start
  startupPlugins = {
    debug = with pkgs.vimPlugins; [
      nvim-nio
    ];
    general = with pkgs.vimPlugins; {
      always = [
        lze # Lazy loader for plugins
        vim-repeat # Allows plugins to invoke .
        plenary-nvim # Library for most other plugins
        mkdir-nvim
        bufdelete-nvim
        nvim-scrollbar
      ];
      extra = [
        nvim-tree-lua
        nvim-web-devicons
        lualine-nvim
        lualine-lsp-progress
        fidget-nvim
        nvim-notify
      ];
      theme = with pkgs.vimPlugins; (
        builtins.getAttr (categories.general.theme or "onedark") {
          # Theme switcher without creating a new category
          "onedark" = onedark-nvim;
          "catppuccin" = catppuccin-nvim;
          "catppuccin-mocha" = catppuccin-nvim;
          "catppuccin-latte" = catppuccin-nvim;
        }
      );
      telescope = with pkgs.vimPlugins; [
        telescope-nvim
        telescope-fzf-native-nvim
        telescope-ui-select-nvim
        urlview-nvim
      ];
    };
  };

  optionalPlugins = {
    debug = with pkgs.vimPlugins; [
      nvim-dap
      nvim-dap-ui
      nvim-dap-virtual-text
    ];
    general = {
      always = with pkgs.vimPlugins; [
        nvim-lspconfig
        nvim-surround
        which-key-nvim
        trouble-nvim
        aerial-nvim
        conform-nvim
        nvim-lint
      ];
      extra = with pkgs.vimPlugins; [
        comment-nvim
        undotree
        indent-blankline-nvim
        vim-startuptime
        zen-mode-nvim
        twilight-nvim
        toggleterm-nvim
      ];
      cmp = with pkgs.vimPlugins; [
        nvim-cmp
        luasnip
        cmp_luasnip
        friendly-snippets
        cmp-nvim-lsp
        cmp-nvim-lsp-signature-help
        cmp-nvim-lua
        cmp-spell
        cmp-async-path
        cmp-vimtex
        cmp-emoji
        #cmp-nerdfont
        cmp-cmdline
        cmp-cmdline-history
        cmp-buffer
        lspkind-nvim
      ];
      git = with pkgs.vimPlugins; [
        gitsigns-nvim
        vim-fugitive
        vim-rhubarb
      ];
      treesitter = with pkgs.vimPlugins; [
        nvim-treesitter-textobjects
        nvim-treesitter.withAllGrammars
        indent-blankline-nvim
      ];
    };
    languages = {
      lua = with pkgs.vimPlugins; [
        lazydev-nvim
      ];
      latex = with pkgs.vimPlugins; [
        vimtex
        nabla-nvim
      ];
      markdown = with pkgs.vimPlugins; [
        mkdnflow-nvim
        markdown-preview-nvim
        glow-nvim
        obsidian-nvim
      ];
    };
  };

  # shared libraries to be added to LD_LIBRARY_PATH
  # variable available to nvim runtime
  sharedLibraries = {
    general = with pkgs; [
      libgit2
    ];
  };

  environmentVariables = {
    test = {
      CATTESTVAR = "It worked!";
    };
  };

  extraWrapperArgs = {
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/setup-hooks/make-wrapper.sh
    test = [
      ''--set CATTESTVAR2 "It worked again!"''
    ];
  };

  # lists of the functions you would have passed to
  # python.withPackages or lua.withPackages
  extraPython3Packages = {
    general.always = python-pkgs: [
      python-pkgs.pynvim
    ];
  };
  # populates $LUA_PATH and $LUA_CPATH
  extraLuaPackages = {
    general.always = [(_: [])];
  };
  extraCats = {
    general = [
      ["general" "always"]
    ];
  };
}
