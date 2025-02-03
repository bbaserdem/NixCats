# Package definitions
# Each value in this attribute set should be a set function with pkgs
{
  inputs,
  nixpkgs,
  utils,
  ...
}: {
  # Full neovim instance
  nixCats-full = {pkgs, ...} @ misc: {
    # they contain a settings set defined above
    # see :help nixCats.flake.outputs.settings
    settings = {
      wrapRc = true;
      # IMPORTANT:
      # your alias may not conflict with your other packages.
      aliases = ["fullCat"];
      configDirName = "nvim-nixCats";
      neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
    };
    # and a set of categories that you want
    # (and other information to pass to lua)
    categories = {
      debug = true;
      general = {
        always = true;
        extra = true;
        theme = "onedark";
        # Specific plugins
        cmp = true;
        git = true;
        telescope = true;
        treesitter = true;
      };
      languages = {
        latex = true;
        lua = true;
        markdown = true;
        nix = true;
        ts = true;
      };
    };

    # Extra info to provide
    extra = {};
  };

  # An empty installation of neovim
  nixCats-none = {pkgs, ...} @ misc: {
    settings = {
      wrapRc = true;
      configDirName = "nixCats-nvim";
      aliases = ["baseCat"];
    };
    categories = {
      debug = false;
      general = false;
      languages = false;
    };
  };
}
