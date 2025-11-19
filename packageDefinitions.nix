# Package definitions
# Each value in this attribute set should be a set function with pkgs
{
  inputs,
  nixpkgs,
  utils,
  ...
}: {
  # The way the tree is established is;
  # <category>
  # ├─ system         : Plugins that should be there by default
  # ├─ tools          : Functionality that is language agnostic
  # │  ├─ debug       : Debug related tooling
  # │  ├─ git         : Git integration
  # │  ├─ completion  : Code completion
  # │  ├─ files       : File browser
  # │  ├─ formatting  : Linting and spelling
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

  nixCats = {pkgs, ...} @ misc: {
    # Full neovim instance

    # they contain a settings set defined above
    # see :help nixCats.flake.outputs.settings
    settings = {
      suffix-path = true;
      suffix-LD = true;
      wrapRc = true;
      configDirName = "neovim-nixCats";
      neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.neovim;
      hosts = {
        python3.enable = true;
        node.enable = true;
      };
      # Extra aliases
      aliases = [
        "neovim-nixCats"
      ];
    };

    # and a set of categories that you want
    categories = {
      system = true;
      tools = true;
      languages = true;
      ui = true;
    };

    # Extra arguments ta be made available to nixCats
    extra = {
      colorscheme = {
        name = "material";
        style = "darker";
        translucent = true;
      };
      # Override this in a home-manager config file
      nix = {
        flake = "";
        host = "";
        user = "";
      };
    };
  };

  # An empty installation of neovim, to use with the system
  nixCats-none = {pkgs, ...} @ misc: {
    settings = {
      suffix-path = true;
      suffix-LD = true;
      wrapRc = true;
      configDirName = "neovim-nixCats-none";
      neovim-unwrapped = pkgs.neovim-unwrapped;
      hosts = {
        python3.enable = false;
        node.enable = false;
      };
      # Extra aliases
      aliases = [
        "neovim-nixCats-none"
      ];
    };
    categories = {
      # Disable everything but the needed plugins
      system = true;
      tools = false;
      languages = false;
    };
    extra = {
      # Just a marker to make sure some behavior is disabled
      weAreOld = true;
      colorscheme = {
        name = "stylix";
        style = "dark";
        translucent = false;
      };
    };
  };
}
