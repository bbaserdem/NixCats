# The category definitions
# Import inputs from the main flake, and return the function
{
  inputs,
  ...
}: {
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
    main = [
      universal-ctags   # Tag generation for multiple languages
      ripgrep           # Fast grep implementation
      fd                # Fast find implementation
      findutils         # Find implementation
      wl-clipboard      # Wayland clipboard communication
      xclip             # Xorg clipboard communication
    ];

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
      dwt1-shell-color-scripts
      imagemagick       # For image displaying with tree
    ];

    languages = {
      c = [
        clang-tools
      ];
      latex = [
        pplatex         # Latex log parsing tool
        neovim-remote   # Client server for vimtex to run latexmk
        xdotool         # Needed for zathura
        pstree
      ];
      lua = [
        lua-language-server
      ];
      markdown = [
        glow            # Markdown typesetter for terminal
      ];
      nix = [
        nix-doc
        nixd
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
      lze               # Lazy loader for plugins (NEEDED)
    ];

    functionality = [
      oil-nvim          # File browser
      snacks-nvim       # Large library with many small plugins
    ];

    tools.vimspell = [(
      pkgs.runCommand "vimspell-lang" { } ''
        mkdir -p $out/spell
        cp ${inputs.vimspell-tr} $out/spell/tr.utf-8.spl
        cp ${inputs.vimspell-en} $out/spell/en.utf-8.spl
      ''
    )];

    languages.latex = [
      vimtex                  # LaTeX suite, can't be lazy loaded
    ];
  };

  # Lazy loading plugins
  optionalPlugins = with pkgs.vimPlugins; {

    # Main plugins to have
    main = [
      plenary-nvim        # Library for other plugins
      nui-nvim
    ];

    # Debug tools
    debug = [
      nvim-nio                # Library for asyncronous IO for nvim
      nvim-dap                # Debug adapter protocol for nvim
      nvim-dap-ui             # DAP ui
      nvim-dap-virtual-text   # DAP virtual text support
    ];

    # Theme related things
    theme = [
      lspkind-nvim          # Add pictograms to built-in lsp
      nvim-web-devicons
      lualine-nvim          # Statusline
      tabby-nvim            # Tabline
      (builtins.getAttr (extra.colorscheme or "onedark") {
        # Theme switcher without creating a new category
        "onedark" = onedark-nvim;
        "catppuccin" = catppuccin-nvim;
        "catppuccin-mocha" = catppuccin-nvim;
        "catppuccin-macchiato" = catppuccin-nvim;
        "catppuccin-frappe" = catppuccin-nvim;
        "catppuccin-latte" = catppuccin-nvim;
        "catppuccin-gruvbox" = catppuccin-nvim;
      })
    ];

    status = [
      # Leaving this here on how to include non-packaged plugin
      # { name = "incline.nvim"; plugin = pkgs.neovimPlugins.incline-nvim; }
      trouble-nvim        # Sidebar that shows diagnostics and such
      aerial-nvim         # Code outline window
      which-key-nvim      # Shows keybind groups
      fidget-nvim         # Shows LSP progress in a text box
    ];

    functionality = [
      mini-nvim           # Library
      conform-nvim        # Code formatter
      nvim-lint           # Linter without LSP
      mkdir-nvim          # Automatically make directories when saving files
      urlview-nvim        # Detects URLs (after telescope switch)
      neo-tree-nvim       # File browser
      image-nvim          # Image display for neo-tree
      nvim-window-picker  # File browser dependency
      pomo-nvim           # Pomodoro timer
    ];

    mini = [
      mini-ai
      mini-align
      mini-comment
      mini-move
      mini-operators
      mini-pairs
      mini-splitjoin
      mini-surround
      mini-basics
      mini-bracketed
      mini-jump
      mini-cursorword
      mini-hipatterns
      mini-map
    ];

    # Autocompletion engines
    completion = {
      blink = [
        blink-cmp                     # Completion plugin
        # Engines
        blink-ripgrep-nvim            # Ripgrep completion from entire project
        blink-emoji-nvim              # Emoji inserter
        blink-cmp-spell               # Suggestions from spellsuggest
        blink-compat                  # Enables compatibility with cmp
        cmp-vimtex                    # Vimtex source for cmp
      ];
      cmp = [
        nvim-cmp
        # Completion engines
        cmp_luasnip                   # Snippet suggestions
        cmp-nvim-lsp                  # LSP suggestions
        cmp-nvim-lsp-signature-help   # LSP signature help
        cmp-spell                     # Autocomplete from spelllang
        cmp-async-path                # Autocomplete from filesystem (no-block)
        cmp-vimtex                    # Vimtex source for cmp
        cmp-cmdline                   # Commandline completion
        cmp-cmdline-history           # Commandline history completion
        cmp-buffer                    # Buffer completion
        cmp-rg                        # Ripgrep
        cmp-dap                       # DAP buffer completion
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
        lazydev-nvim            # Configure editing nvim configuration files
      ];
      markdown = [
        nabla-nvim              # Render latex equations
        mkdnflow-nvim           # Navigate wiki links
        glow-nvim               # Render markdown in nvim terminal
        obsidian-nvim           # Interact with obsidian vault
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
  extraPython3Packages = {
    main = python-pkgs: [
      python-pkgs.pynvim
    ];
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
      [ "tools" "vimspell" ]
      [ "theme" ]
    ];
    functionality = [
      # [ "mini" ]
    ];
    completion = {
      blink = [
        [ "completion" "snippets" "luasnip" ]
      ];
      cmp = [
        [ "completion" "snippets" "luasnip" ]
      ];
    };
  };
}
