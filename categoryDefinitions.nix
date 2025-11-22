# The category definitions
# Import inputs from the main flake, and return the function
{inputs, ...}: {
  pkgs,
  settings,
  categories,
  extra,
  name,
  mkNvimPlugin,
  ...
} @ packageDef: let
  # Some plugins
  eink-nvim = {
    name = "e-ink.nvim";
    plugin = pkgs.neovimPlugins.e-ink-nvim;
  };
  myVimspell = pkgs.runCommand "vimspell-lang" {} ''
    mkdir -p $out/spell
    cp ${inputs.vimspell-tr} $out/spell/tr.utf-8.spl
    cp ${inputs.vimspell-en} $out/spell/en.utf-8.spl
  '';
in {
  # The way the tree is established is;
  # <category>
  # ├─ system         : Plugins that should be there by default
  # ├─ tools          : Functionality that is language agnostic
  # │  ├─ completion  : Code completion
  # │  ├─ debug       : Debug related tooling
  # │  ├─ files       : File browser
  # │  ├─ formatting  : Linting and spelling
  # │  ├─ git         : Git integration
  # │  ├─ motions     : Movement related plugins
  # │  ├─ snippets    : Snippet engine
  # │  ├─ treesitter  : Code parsing
  # │  └─ utility     : Small functionalities
  # ├─ ui             : Viewing related plugins
  # │  ├─ bar         : Status bar items
  # │  ├─ theme       : Colorscheme and theme
  # │  ├─ picker      : The picker to use (telescope)
  # │  └─ views       : Screens for viewing code status
  # └─ languages      : Configured languages
  #    ├─ c
  #    ├─ go
  #    ├─ latex
  #    ├─ lua
  #    ├─ markdown
  #    ├─ nix
  #    ├─ python
  #    ├─ rust
  #    ├─ shell
  #    └─ typescript

  # System level requirements
  # These packages should be available to the nixCat instance
  # Similar to programs.neovim.extraPackages in homeManager
  # This is LSPs and system-wide tooling
  lspsAndRuntimeDeps = with pkgs; {
    tools = {
      files = [
        imagemagick # For image displaying with image.nvim and snacks.image
      ];
      treesitter = [
        tree-sitter
      ];
      git = [
        git
        lazygit
        gh
      ];
      search = [
        ripgrep # Fast grep implementation
        fd # Fast find implementation
        findutils # Find implementation
      ];
      utility = [
        xclip # Xorg clipboard communication
        universal-ctags # Tag generation for multiple languages
      ];
    };

    ui = {
      views = [
        dwt1-shell-color-scripts # For terminal color scripts
      ];
    };

    languages = {
      c = [
        clang-tools
      ];
      go = [
        go
        gotools
      ];
      latex = [
        # pplatex # Latex log parsing tool
        texlivePackages.chktex # Linter
        neovim-remote # Client server for vimtex to run latexmk
        pstree
        bibtex-tidy # Latex cleaner
        tex-fmt
        ltex-ls-plus
        languagetool
      ];
      lua = [
        lua-language-server
        stylua
      ];
      markdown = [
        vale # Linter
        glow # Markdown typesetter for terminal
        ltex-ls-plus
        languagetool
      ];
      nix = [
        manix
        nix-doc
        nixd
        alejandra
      ];
      python = [
        ruff
        ty
      ];
      rust = [
        rustfmt
      ];
      shell = [
        bash
        dash
        dotenv-linter
        shellcheck
      ];
      typescript = [
        nodePackages.typescript-language-server
      ];
    };
  };

  # Plugins that don't need lazy loading
  startupPlugins = with pkgs.vimPlugins; {
    # Main plugins to have
    system = [
      lze # Lazy loader for plugins (NEEDED)
      lzextras # Lazy loader extras
    ];

    tools = {
      files = [
        oil-nvim # File browser
        oil-git-status-nvim
      ];
      formatting = [
        myVimspell
      ];
    };

    ui = {
      theme = [
        nvim-web-devicons
      ];
      views = [
        snacks-nvim
      ];
    };

    languages = {
      latex = [
        vimtex # LaTeX suite, can't be lazy loaded
      ];
    };
  };

  # Lazy loading plugins
  optionalPlugins = with pkgs.vimPlugins; {
    system = [
      plenary-nvim # Library for other plugins
      nui-nvim
      nvim-nio
      mini-base16 # Request the minimal theme
    ];

    tools = {
      # Completion engines
      completion = [
        nvim-lspconfig # LSP default configuration
        nvim-cmp # Completion engine
        # Completion engines; general
        cmp_luasnip # Snippet suggestions
        cmp-nvim-lsp # LSP suggestions
        cmp-nvim-lsp-signature-help # LSP signature help
        cmp-async-path # Autocomplete from filesystem (no-block)
        cmp-rg # Ripgrep
        cmp-buffer # Buffer completion
        cmp-spell # Autocomplete from spelllang
        # Completion engines; commandline
        cmp-cmdline # Commandline completion
        cmp-cmdline-history # Commandline history completion
        # Completion engines; language
        cmp-vimtex # Vimtex source for cmp
        # Completion engines, other
        cmp-dap # DAP buffer completion
        # Snippets
        luasnip
        friendly-snippets
        # Other
        lspkind-nvim # Add pictograms to built-in lsp
      ];
      # Debug tools
      debug = [
        nvim-dap # Debug adapter protocol for nvim
        nvim-dap-ui # DAP ui
        nvim-dap-virtual-text # DAP virtual text support
      ];
      files = [
        yazi-nvim # File browser
        neo-tree-nvim # Sidebar file browser
        nvim-lsp-file-operations
        image-nvim
      ];
      formatting = [
        conform-nvim # Code formatter
        nvim-lint # Linter without LSP
      ];
      git = [
        gitsigns-nvim
        vim-fugitive
      ];
      motions = [
        mini-nvim # Library for motions
      ];
      treesitter = [
        nvim-treesitter.withAllGrammars
        nvim-treesitter-context
        nvim-treesitter-refactor
        nvim-treesitter-textobjects
      ];
      utility = [
        mkdir-nvim # Automatically make directories when saving files
        urlview-nvim # Detects URLs
        bufdelete-nvim # Delete buffers without touching windows
      ];
    };

    ui = {
      theme = [
        # Themes that may be used
        catppuccin-nvim
        cyberdream-nvim
        eink-nvim
        gruvbox-nvim
        gruvbox-material-nvim
        kanagawa-nvim
        material-nvim
        melange-nvim
        nightfox-nvim
        onedark-nvim
      ];
      bar = [
        lualine-nvim # Statusline
        tabby-nvim # Tabline
      ];
      views = [
        aerial-nvim # Code outline window
        fidget-nvim # Shows LSP progress in a text box
        trouble-nvim # Sidebar that shows diagnostics and such
        which-key-nvim # Shows keybind groups
        twilight-nvim # Dims inactive code
      ];
      picker = [
        telescope-nvim
        # Extensions
        telescope-manix
        telescope-fzf-native-nvim
        telescope-dap-nvim
        telescope-ui-select-nvim
      ];
    };

    # Plugins to lazy load on given languages
    languages = {
      python = [
        nvim-dap-python
      ];
      lua = [
        lazydev-nvim # Configure editing nvim configuration files
      ];
      markdown = [
        nabla-nvim # Render latex equations
        mkdnflow-nvim # Navigate wiki links
        glow-nvim # Render markdown in nvim terminal
        render-markdown-nvim
      ];
    };
  };

  # shared libraries to be added to LD_LIBRARY_PATH
  # variable available to nvim runtime
  sharedLibraries = with pkgs; {
    tools = {
      utility = [
        libnotify
      ];
      git = [
        libgit2
      ];
    };
  };

  environmentVariables = {
  };

  extraWrapperArgs = {
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/setup-hooks/make-wrapper.sh
  };

  # lists of the functions you would have passed to
  # python.withPackages or lua.withPackages
  python3.libraries = {
    system = python-pkgs:
      with python-pkgs; [
        pynvim # Python client for neovim
      ];
    languages = {
      markdown = python-pkgs:
        with python-pkgs; [
          mdformat # Markdown formatter
          pylatexenc # Latex to unicode and back conversion
        ];
      python = python-pkgs:
        with python-pkgs; [
          ruff # Python linter and code formatter
          uv # Package manager for python
          debugpy # Debugger adapter
        ];
      other = python-pkgs:
        with python-pkgs; [
          yq # Yaml parser
        ];
    };
  };

  # Populates $LUA_PATH and $LUA_CPATH
  extraLuaPackages = {
    tools = {
      files = [
        (lua-pkgs:
          with lua-pkgs; [
            magick # Imagemagick lua bindings
            image-nvim # Image library for nvim
          ])
      ];
      completion = [
        (lua-pkgs:
          with lua-pkgs; [
            jsregexp # JavaScript regex for lua
          ])
      ];
    };
    languages = {
      lua = [
        (lua-pkgs:
          with lua-pkgs; [
            luacheck # Lua linter
          ])
      ];
    };
  };

  # Defining language = [ "language" "default"]; in this attrset would
  # cause any import of a subcategory of language to import language.default as well
  extraCats = {
  };
}
