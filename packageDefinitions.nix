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
      aliases = ["nvimCat"];
      configDirName = "nvim-nixCats";
      neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
    };

    # and a set of categories that you want
    # (and other information to pass to lua)
    categories = {
      # Arguments to pass
      colorscheme = "gruvbox-material";
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
      autocomplete.cmp = true;
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
