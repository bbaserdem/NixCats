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
  none = pkgs.mkShell {
    name = "neovim-nixCats-none";
    packages = [
      packages.neovim-nixCats-none
      pkgs.nodejs-slim
      pkgs.pnpm
    ];
    inputsFrom = [];
    shellHook = ''
    '';
  };
}
