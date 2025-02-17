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

  neovim-nixCats-full = {pkgs, ...} @ misc: {
    # Full neovim instance

    # they contain a settings set defined above
    # see :help nixCats.flake.outputs.settings
    settings = {
      wrapRc = true;
      aliases = [
        "nvim-nixCats-full"
        "neovimCats-full"
        "nvimCats-full"
        "nx-full"
      ];
      # Still load configuration from base neovim, to allow for system integration
      configDirName = "neovim-nixCats-full";
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
      colorscheme = {
        name = "gruvbox";
        style = "dark";
        translucent = true;
      };
      # Override this in a home-manager config
      nix = {
        flake = "";
        host = "";
        user = "";
      };
      obsidian = {
        workspaces = [
          {
            name = "Test";
            path = "~/Media/Notes";
          }
        ];
      };
    };
  };

  # An empty installation of neovim, to use with the system
  neovim-nixCats-none = {pkgs, ...} @ misc: {
    settings = {
      wrapRc = true;
      configDirName = "neovim-nixCats-none";
      aliases = [
        "nvim-nixCats-none"
        "neovimCats-none"
        "nvimCats-none"
        "nx-none"
      ];
    };
    categories = {
      main = true;
    };
    extra = {
      weAreOld = true;
      colorscheme = {
        name = "melange";
        style = "dark";
        translucent = false;
      };
    };
  };
}
