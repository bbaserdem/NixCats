# NixCats: flake.nix
{
  description = "bbaserdem's NixCats-nvim configuration";

  inputs = {
    # ----- System Flakes ----- #
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    # Neovim nightly overlay
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    # Nixcats
    nixCats.url = "github:BirdeeHub/nixCats-nvim";

    # Spelling libraries
    vimspell-tr = {
      url = "https://ftp.nluug.nl/pub/vim/runtime/spell/tr.utf-8.spl";
      flake = false;
    };
    vimspell-en = {
      url = "https://ftp.nluug.nl/pub/vim/runtime/spell/en.utf-8.spl";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    nixCats,
    ...
  } @ inputs: let

    # Make utils more accessible
    inherit (nixCats) utils;

    # Path for lua file entry is here
    luaPath = "${./.}";

    # Generate shell config for everything
    forEachSystem = utils.eachSystem nixpkgs.lib.platforms.all;
    extra_pkg_config = {
      allowUnfree = true;
    };

    # Apply overlays
    dependencyOverlays = [
      # Grab all inputs named `plugins-<pluginName>`
      (utils.standardPluginOverlay inputs)
      # Apply nightly overlay to pull from neovim-nightly
      inputs.neovim-nightly-overlay.overlays.default
    ];

    # Category definitions are here; this variable should be a function!
    categoryDefinitions = import ./categoryDefinitions.nix;

    # Package definitions are here, this should be an attrset
    packageDefinitions = import ./packageDefinitions.nix {
      inherit inputs nixpkgs utils;
    };

    # The default package to use from packageDefinitions
    defaultPackageName = "nixCats-full";

  in forEachSystem (system: let

    # The builder function
    nixCatsBuilder = utils.baseBuilder luaPath {
      inherit
        system
        dependencyOverlays
        extra_pkg_config
        nixpkgs
        ;
    } categoryDefinitions packageDefinitions;

    # Setting the default package
    defaultPackage = nixCatsBuilder defaultPackageName;

    # For using utils, such as pkgs.mkShell in the outputs
    pkgs = import nixpkgs { inherit system; };

  in {

    # this will make a package out of each of the packageDefinitions defined above
    # and set the default package to the one passed in here.
    packages = utils.mkAllWithDefault defaultPackage;

    # The dev-shell
    # and add whatever else you want in it.
    devShells = import ./shell.nix {
      inherit pkgs defaultPackageName defaultPackage;
    };

  }) // (let

    # We also export a nixos module to allow reconfiguration from configuration.nix
    # and the same for home manager
    inheritVars = { inherit
      defaultPackageName
      dependencyOverlays
      luaPath
      categoryDefinitions
      packageDefinitions
      extra_pkg_config
      nixpkgs
      ;
    };
    nixosModule = utils.mkNixosModules inheritVars;
    homeModule = utils.mkHomeModules inheritVars;
  in {
    # these outputs will be NOT wrapped with ${system}

    # This will make an overlay out of each of the packageDefinitions defined above
    # and set the default overlay to the one named here.
    overlays = utils.makeOverlays luaPath {
      # we pass in the things to make a pkgs variable to build nvim with later
      inherit nixpkgs dependencyOverlays extra_pkg_config;
      # and also our categoryDefinitions
    } categoryDefinitions packageDefinitions defaultPackageName;

    nixosModules.default = nixosModule;
    homeManagerModules.default = homeModule;

    inherit utils nixosModule homeModule;
    inherit (utils) templates;

  });
}
