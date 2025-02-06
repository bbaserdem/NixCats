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
    # IMPORTANT: your alias may not conflict with your other packages.
    settings = {
      wrapRc = true;
      aliases = [
        "nvimCat"
        "fullCat"
      ];
      configDirName = "nvim-nixCats";
      neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
    };

    # and a set of categories that you want
    categories = {
      # Package sets to include
      theme = true;
      main = true;
      treesitter = true;
      debug = true;
      filebrowser = true;
      status = true;
      functionality = true;
      ui = true;
      notifications = true;
      search = true;
      completion.blink = true;
      git = true;
      languages = {
        c = true;
        latex = true;
        lua = true;
        markdown = true;
        nix = true;
        ts = true;
        vimspell = true;
      };
    };

    # Extra arguments ta be made available to nixCats
    extra = {
      colorscheme = "gruvbox-material";
      nixpkgs = nixpkgs;
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
