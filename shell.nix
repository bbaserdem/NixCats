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
      pkgs.nodejs-slim
      pkgs.pnpm
    ];
    inputsFrom = [];
    shellHook = ''
    '';
  };
  # Shell to test minimal nvim config
  none = pkgs.mkShell {
    name = "nixCats-none";
    packages = [
      packages.nixCats-none
      pkgs.nodejs-slim
      pkgs.pnpm
    ];
    inputsFrom = [];
    shellHook = ''
    '';
  };
}
