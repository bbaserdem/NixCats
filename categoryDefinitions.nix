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
  # ├─ debug
  # ├─ main
  # ├─ ...
  # └─ languages
  #    └─ <specific language settings>

  # System level requirements
  # These packages should be available to the nixCat instance
  # Similar to programs.neovim.extraPackages in homeManager
  lspsAndRuntimeDeps = with pkgs; {
    main = [
      universal-ctags   # Tag generation for multiple languages
      ripgrep           # Fast grep implementation
      fd                # Fast find implementation
      wl-clipboard      # Wayland clipboard communication
      xclip             # Xorg clipboard communication
    ];
    treesitter = [
      tree-sitter
    ];

    languages = {
      c = [
        clang-tools
      ];
      latex = [
        pplatex         # Latex log parsing tool
        neovim-remote   # Client server for vimtex to run latexmk
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
      plenary-nvim      # Library for most other plugins
    ];

    # Debug tools
    debug = [
      nvim-nio          # Library for asyncronous IO for nvim
      vim-startuptime   # Time items in nvim
    ];

    # Theme related things
    theme = [
      lspkind-nvim      # Add pictograms to built-in lsp
      (builtins.getAttr (categories.colorscheme or "onedark") {
        # Theme switcher without creating a new category
        "onedark" = onedark-nvim;
        "gruvbox-material" = catppuccin-nvim;
        "catppuccin" = catppuccin-nvim;
        "catppuccin-mocha" = catppuccin-nvim;
        "catppuccin-macchiato" = catppuccin-nvim;
        "catppuccin-frappe" = catppuccin-nvim;
        "catppuccin-latte" = catppuccin-nvim;
      })
    ];

    # Filebrowser
    filebrowser = [
      nvim-tree-lua         # File browser
    ];

    # Status indication
    status = [
      lualine-nvim          # Info bar at the bottom of screen
      nvim-scrollbar        # Scrollbar to the side menu
      indent-blankline-nvim # Indentation level visualizer
    ];

    # Notification menu
    notifications = [
      fidget-nvim           # Shows LSP progress in a text box
      nvim-notify           # Notification area
      which-key-nvim        # Shows keybind groups
    ];

    # Search functionality
    search = with pkgs.vimPlugins; [
      telescope-nvim
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
    ];

    # Language specific
    languages = {
      vimspell = [(
        pkgs.runCommand "vimspell-lang" { } ''
          mkdir -p $out/spell
          cp ${inputs.vimspell-tr} $out/spell/tr.utf-8.spl
          cp ${inputs.vimspell-en} $out/spell/en.utf-8.spl
        ''
      )];
    };
  };

  # Lazy loading plugins
  optionalPlugins = with pkgs.vimPlugins; {

    # Main plugins to have
    main = [
      nvim-lspconfig      # Configures LSPs
      conform-nvim        # Code formatter
      nvim-lint           # Linter without LSP
    ];

    # Theme-ing related plugins
    theme = [
      nvim-web-devicons
    ];

    # We want to have treesitter
    treesitter = [
      nvim-treesitter.withAllGrammars
      nvim-treesitter-context
      nvim-treesitter-refactor
      nvim-treesitter-textobjects
    ];

    # Debug tools
    debug = [
      nvim-dap                # Debug adapter protocol for nvim
      nvim-dap-ui             # DAP ui
      nvim-dap-virtual-text   # DAP virtual text support
    ];

    status = [
      trouble-nvim        # Sidebar that shows diagnostics and such
      aerial-nvim         # Code outline window
      undotree            # Visualize undo history
    ];

    functionality = [
      nvim-surround     # Quickly surround text with delimiters
      vim-repeat        # Allows plugins to invoke . to repeat
      mkdir-nvim        # Automatically make directories when saving files
      bufdelete-nvim    # Delete buffers without changing window layout
      comment-nvim      # Comment text
    ];

    ui = [
      zen-mode-nvim     # Reduces distraction
      twilight-nvim     # Dims inactive code blocks
      toggleterm-nvim   # Launch terminal in nvim
    ];

    # Search items
    search = [
      urlview-nvim
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
        cmp-nvim-lua
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
      ];
      luasnip = [
        luasnip
        friendly-snippets
      ];
    };

    # Git related toolkit
    git = [
      gitsigns-nvim
      vim-fugitive
      vim-rhubarb
    ];

    # Plugins to lazy load on given languages
    languages = {
      latex = [
        vimtex          # LaTeX suite
        nabla-nvim      # Render latex equations
      ];
      lua = [
        lazydev-nvim    # Configure editing nvim configuration files
      ];
      markdown = [
        mkdnflow-nvim           # Navigate wiki links
        markdown-preview-nvim   # Render markdown in browser
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
    completion.luasnip = [
      (lua-pkgs: [
        lua-pkgs.jsregexp
      ])
    ];
  };

  # Defining language = [ "language" "default"]; in this attrset would
  # cause any import of a subcategory of language to import language.default as well
  extraCats = {
    completion = {
      blink = [
        [ "completion" "luasnip" ]
      ];
      cmp = [
        [ "completion" "luasnip" ]
      ];
    };
  };
}
