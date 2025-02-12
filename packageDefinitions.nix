# Package definitions
# Each value in this attribute set should be a set function with pkgs
{
  inputs,
  nixpkgs,
  utils,
  ...
}: {
  # The way the category tree is established is;
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
  # └─ languages
  #    └─ <specific language settings>

  nixCats-full = {pkgs, ...} @ misc: {
    # Full neovim instance

    # they contain a settings set defined above
    # see :help nixCats.flake.outputs.settings
    settings = {
      wrapRc = true;
      aliases = [ # !!!: Your alias can't conflict with your other packages.
        "nc-full"
        "nvim-nc-full"
      ];
      configDirName = "nvim-nixCats";
      neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
    };

    # and a set of categories that you want
    categories = {
      main = true;
      # Package sets to include
      debug = true;
      tools = true;
      completion.cmp = true;
      functionality = true;
      status = true;
      languages = true;
    };

    # Extra arguments ta be made available to nixCats
    extra = {
      colorscheme = "catppuccin-gruvbox";
      # Override this in a home-manager config
      nix = {
        flake = "";
        host = "";
        user = "";
      };
      obsidian = {
        workspaces = [
          { name = "Test";
            path = "~/Media/Notes";
          }
        ];
      };
    };
  };

  # An empty installation of neovim
  nixCats-none = {pkgs, ...} @ misc: {
    settings = {
      wrapRc = true;
      configDirName = "nixCats-nvim";
      aliases = ["baseCat"];
    };
    categories = {
    };
  };
}
