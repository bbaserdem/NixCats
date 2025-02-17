# Dev shells for nixcats
{
  pkgs,
  defaultPackageName,
  defaultPackage,
  packages,
  ...
} @ args: {
  # Default shell to test the nvim config
  default = pkgs.mkShell {
    name = defaultPackageName;
    packages = [
      defaultPackage
    ];
    inputsFrom = [];
    shellHook = ''
    '';
  };
  none = pkgs.mkShell {
    name = "neovim-nixCats-none";
    packages = [
      packages.neovim-nixCats-none
    ];
    inputsFrom = [];
    shellHook = ''
    '';
  };
}
