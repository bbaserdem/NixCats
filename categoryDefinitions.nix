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
  # │  ├─ search      : Pickers functionality
  # │  ├─ snippets    : Snippet engine
  # │  ├─ treesitter  : Code parsing
  # │  └─ utility     : Small functionalities
  # ├─ ui             : Viewing related plugins
  # │  ├─ bar         : Status bar items
  # │  ├─ theme       : Colorscheme and theme
  # │  ├─ views       : Screens for viewing code status
  # │  └─ icons       : Icon usage
  # └─ languages      : Configured languages
  #    ├─ c
  #    ├─ latex
  #    ├─ lua
  #    ├─ markdown
  #    ├─ nix
  #    ├─ python
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
      latex = [
        # pplatex # Latex log parsing tool
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
        glow # Markdown typesetter for terminal
        ltex-ls-plus
        languagetool
      ];
      nix = [
        nix-doc
        nixd
        alejandra
      ];
      python = [
        ruff
      ];
      shell = [
        bash
        dash
        dotenv-linter
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
      ];
      formatting = [
        myVimspell
      ];
    };

    ui = {
      theme = [
        nvim-web-devicons
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
      mini-base16 # Request the minimal theme
    ];

    tools = {
      # Completion engines
      completion = [
        nvim-lspconfig # LSP default configuration
        nvim-cmp # Completion engine
        # Completion engines
        cmp_luasnip # Snippet suggestions
        cmp-nvim-lsp # LSP suggestions
        cmp-nvim-lsp-signature-help # LSP signature help
        cmp-spell # Autocomplete from spelllang
        cmp-async-path # Autocomplete from filesystem (no-block)
        cmp-vimtex # Vimtex source for cmp
        cmp-cmdline # Commandline completion
        cmp-cmdline-history # Commandline history completion
        cmp-buffer # Buffer completion
        cmp-rg # Ripgrep
        cmp-dap # DAP buffer completion
      ];
      # Debug tools
      debug = [
        nvim-nio # Library for asyncronous IO for nvim
        nvim-dap # Debug adapter protocol for nvim
        nvim-dap-ui # DAP ui
        nvim-dap-virtual-text # DAP virtual text support
      ];
      files = [
        yazi-nvim # File browser
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
        flash-nvim # Movement tool
        mini-nvim # Library for motions
      ];
      search = [
      ];
      snippets = [
        luasnip
        friendly-snippets
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
        pomo-nvim # Pomodoro timer
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
      ];
      icons = [
        lspkind-nvim # Add pictograms to built-in lsp
      ];
    };

    # Plugins to lazy load on given languages
    languages = {
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
      utilities = [
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
      snippets = [
        (lua-pkgs:
          with lua-pkgs; [
            jsregexp # JavaScript regex for lua
          ])
      ];
    };
  };

  # Defining language = [ "language" "default"]; in this attrset would
  # cause any import of a subcategory of language to import language.default as well
  extraCats = {
  };
}
