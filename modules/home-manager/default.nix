{ lib, ... }:
{
  imports = [
    (lib.modules.importApply ../global.nix { themeModules = import ./all-modules.nix; })
  ];
}
