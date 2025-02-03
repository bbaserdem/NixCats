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
        mkdir-nvim # TODO: add this to non_nix_download
        bufdelete-nvim # TODO: add this to non_nix_download
        nvim-scrollbar # TODO: add this to non_nix_download
      ];
      extra = [
        nvim-tree-lua # TODO: add this to non_nix_download
        nvim-web-devicons
        lualine-nvim
        lualine-lsp-progress # TODO: add this to non_nix_download
        fidget-nvim
        nvim-notify
      ];
      theme = with pkgs.vimPlugins; (
        builtins.getAttr (categories.general.theme or "onedark") {
          # Theme switcher without creating a new category
          "onedark" = onedark-nvim;
          "catppuccin" = catppuccin-nvim; # TODO: add this to non_nix_download
          "catppuccin-mocha" = catppuccin-nvim;
          "catppuccin-latte" = catppuccin-nvim;
        }
      );
      telescope = with pkgs.vimPlugins; [
        telescope-nvim
        telescope-fzf-native-nvim
        telescope-ui-select-nvim
        urlview-nvim # TODO: add this to non_nix_download
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
        trouble-nvim # TODO: add this to non_nix_download
        aerial-nvim # TODO: add this to non_nix_download
        conform-nvim
        nvim-lint
      ];
      extra = with pkgs.vimPlugins; [
        comment-nvim
        undotree
        vim-startuptime # TODO: add this to non_nix_download
        zen-mode-nvim # TODO: add this to non_nix_download
        twilight-nvim # TODO: add this to non_nix_download
        toggleterm-nvim # TODO: add this to non_nix_download
      ];
      cmp = with pkgs.vimPlugins; [
        nvim-cmp
        luasnip
        cmp_luasnip
        friendly-snippets
        cmp-nvim-lsp
        cmp-nvim-lsp-signature-help
        cmp-nvim-lua
        cmp-spell # TODO: add this to non_nix_download
        cmp-async-path # TODO: add this to non_nix_download
        cmp-vimtex # TODO: add this to non_nix_download
        cmp-emoji # TODO: add this to non_nix_download
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
        indent-blankline-nvim # TODO: add this to non_nix_download
      ];
    };
    languages = {
      lua = with pkgs.vimPlugins; [
        lazydev-nvim
      ];
      latex = with pkgs.vimPlugins; [
        vimtex # TODO: add this to non_nix_download
        nabla-nvim # TODO: add this to non_nix_download
      ];
      markdown = with pkgs.vimPlugins; [
        mkdnflow-nvim # TODO: add this to non_nix_download
        markdown-preview-nvim
        glow-nvim # TODO: add this to non_nix_download
        obsidian-nvim # TODO: add this to non_nix_download
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
