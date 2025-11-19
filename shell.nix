# Dev shells for nixcats
{
  pkgs,
  defaultPackageName,
  defaultPackage,
  packages,
  ...
} @ args: let
  mergeAttrs = pkgs.lib.recursiveUpdate;
  defaultShellDefinition = {
    packages = [
      pkgs.nodejs-slim
      pkgs.pnpm
      defaultPackage
    ];
    inputsFrom = [];
    shellHook = ''
    '';
  };
in {
  # Default shell has ts runtime for AI agents
  default = pkgs.mkShell defaultShellDefinition;
}
