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
  oldworld-nvim = {
    name = "oldworld.nvim";
    plugin = pkgs.neovimPlugins.oldworld-nvim;
  };
  eink-nvim = {
    name = "e-ink.nvim";
    plugin = pkgs.neovimPlugins.e-ink-nvim;
  };
  rosepine-nvim = {
    name = "rose-pine.nvim";
    plugin = pkgs.vimPlugins.rose-pine;
  };
  myVimspell = pkgs.runCommand "vimspell-lang" {} ''
    mkdir -p $out/spell
    cp ${inputs.vimspell-tr} $out/spell/tr.utf-8.spl
    cp ${inputs.vimspell-en} $out/spell/en.utf-8.spl
  '';
in {
  # The way the tree is established is;
  # <category>
  # ├─ main           : Plugins that should be there by default
  # ├─ debug          : Debug related tooling
  # ├─*theme          : Plugins to theme look and feel
  # ├─ tools
  # │  ├─ treesitter  : Code parsing
  # │  ├─*vimspell    : Dictionary languages
  # │  └─ git         : Git integration
  # ├─ completion
  # │  ├─ cmp         : Code completion using nvim-cmp
  # │  ├─ blink       : Code completion using blink.cmp
  # │  └─ snippets
  # │     └─ luasnip  : Snippet engine
  # ├─ functionality  : Various functionality
  # ├─ status         : Status displaying UI elements
  # ├─ ...
  # └─ languages
  #    └─ <specific language settings>

  # System level requirements
  # These packages should be available to the nixCat instance
  # Similar to programs.neovim.extraPackages in homeManager
  # This is LSPs and system-wide tooling
  lspsAndRuntimeDeps = with pkgs; {
    tools = {
      treesitter = [
        tree-sitter
      ];
      git = [
        git
        lazygit
      ];
    };

    functionality = [
      dwt1-shell-color-scripts # For terminal color scripts
      imagemagick # For image displaying with image.nvim and snacks.image
      xclip # Xorg clipboard communication
      universal-ctags # Tag generation for multiple languages
      ripgrep # Fast grep implementation
      fd # Fast find implementation
      findutils # Find implementation
    ];

    languages = {
      c = [
        clang-tools
      ];
      latex = [
        pplatex # Latex log parsing tool
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
        # python312Packages.pylatexenc
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
      ts = [
        nodePackages.typescript-language-server
      ];
    };
  };

  # Plugins that don't need lazy loading
  startupPlugins = with pkgs.vimPlugins; {
    # Main plugins to have
    main = [
      lze # Lazy loader for plugins (NEEDED)
      lzextras # Lazy loader extras
    ];

    functionality = [
      oil-nvim # File browser
      snacks-nvim # Large library with many small plugins
    ];

    theme = [
      nvim-web-devicons
    ];

    tools.vimspell = [
      myVimspell
    ];

    languages.latex = [
      vimtex # LaTeX suite, can't be lazy loaded
    ];
  };

  # Lazy loading plugins
  optionalPlugins = with pkgs.vimPlugins; {
    # Main plugins to have
    main = [
      plenary-nvim # Library for other plugins
      nui-nvim
      (builtins.getAttr (extra.colorscheme.name or "rose-pine") {
        "catppuccin" = catppuccin-nvim;
        "cyberdream" = cyberdream-nvim;
        "e-ink" = eink-nvim;
        "gruvbox" = gruvbox-nvim;
        "gruvbox-material" = gruvbox-material-nvim;
        "kanagawa" = kanagawa-nvim;
        "material" = material-nvim;
        "melange" = melange-nvim;
        "minired" = mini-base16;
        "nightfox" = nightfox-nvim;
        "oldworld" = oldworld-nvim;
        "onedark" = onedark-nvim;
        "rose-pine" = rosepine-nvim;
        "stylix" = mini-base16;
        #"tokyonight" = tokyonight-nvim;
        "vscode" = vscode-nvim;
      })
    ];

    # Debug tools
    debug = [
      nvim-nio # Library for asyncronous IO for nvim
      nvim-dap # Debug adapter protocol for nvim
      nvim-dap-ui # DAP ui
      nvim-dap-virtual-text # DAP virtual text support
    ];

    # Theme related things
    theme = [
      lspkind-nvim # Add pictograms to built-in lsp
      lualine-nvim # Statusline
      tabby-nvim # Tabline
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
      oldworld-nvim
      onedark-nvim
      rosepine-nvim
      # tokyonight-nvim
      vscode-nvim
    ];

    status = [
      # Leaving this here on how to include non-packaged plugin
      # { name = "incline.nvim"; plugin = pkgs.neovimPlugins.incline-nvim; }
      aerial-nvim # Code outline window
      fidget-nvim # Shows LSP progress in a text box
      trouble-nvim # Sidebar that shows diagnostics and such
      which-key-nvim # Shows keybind groups
    ];

    functionality = [
      conform-nvim # Code formatter
      flash-nvim # Movement tool
      mini-nvim # Library
      mkdir-nvim # Automatically make directories when saving files
      neo-tree-nvim # File browser
      image-nvim # Image display for neo-tree
      nvim-lspconfig
      nvim-window-picker # File browser dependency
      nvim-lint # Linter without LSP
      pomo-nvim # Pomodoro timer
      urlview-nvim # Detects URLs (after telescope switch)
    ];

    # Autocompletion engines
    completion = {
      blink = [
        blink-cmp # Completion plugin
        # Engines
        blink-compat # Enables compatibility with cmp
        blink-cmp-spell # Suggestions from spellsuggest
        blink-emoji-nvim # Emoji inserter
        blink-ripgrep-nvim # Ripgrep completion from entire project
        cmp-vimtex # Vimtex source for cmp
      ];
      cmp = [
        nvim-cmp
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
      snippets = {
        luasnip = [
          luasnip
          friendly-snippets
        ];
      };
    };

    # Toolskits with joint plugins
    tools = {
      # We want to have treesitter for things
      treesitter = [
        nvim-treesitter.withAllGrammars
        nvim-treesitter-context
        nvim-treesitter-refactor
        nvim-treesitter-textobjects
      ];
      # Git related toolkit
      git = [
        gitsigns-nvim
        vim-fugitive
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
        #obsidian-nvim # Interact with obsidian vault
        render-markdown-nvim
      ];
    };
  };

  # shared libraries to be added to LD_LIBRARY_PATH
  # variable available to nvim runtime
  sharedLibraries = {
    main = with pkgs; [
      libnotify
    ];
    git = with pkgs; [
      libgit2
    ];
  };

  environmentVariables = {
  };

  extraWrapperArgs = {
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/setup-hooks/make-wrapper.sh
  };

  # lists of the functions you would have passed to
  # python.withPackages or lua.withPackages
  python3.libraries = {
    main = python-pkgs: [
      python-pkgs.pynvim
    ];
    languages = {
      markdown = python-pkgs: [
        python-pkgs.mdformat
        # python-pkgs.pylatexenc
      ];
      python = python-pkgs: [
        python-pkgs.ruff
      ];
    };
  };

  # populates $LUA_PATH and $LUA_CPATH
  extraLuaPackages = {
    functionality = [
      (lua-pkgs: [
        lua-pkgs.magick
        lua-pkgs.image-nvim
      ])
    ];
    completion.luasnip = [
      (lua-pkgs: [
        lua-pkgs.jsregexp
      ])
    ];
  };

  # Defining language = [ "language" "default"]; in this attrset would
  # cause any import of a subcategory of language to import language.default as well
  extraCats = {
    # Various defaults
    main = [
      ["tools" "vimspell"]
    ];
    completion = {
      blink = [
        ["completion" "snippets" "luasnip"]
      ];
      cmp = [
        ["completion" "snippets" "luasnip"]
      ];
    };
  };
}
