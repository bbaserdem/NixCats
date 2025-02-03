# Dev shells for nixcats
{
  pkgs,
  defaultPackageName,
  defaultPackage,
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
}
