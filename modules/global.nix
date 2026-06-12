{ themeModules }:
{
  lib,
  options,
  config,
  pkgs,
  ...
}:
let
  themeLib = import ./lib {
    inherit
      lib
      options
      config
      ;
  };
in
{
  options.nix-theme = {
    flavor = lib.mkOption {
      type = themeLib.types.flavor;
      default = "dark";
      description = "Theme flavor, currently dark/light";
    };
    darkTheme = lib.mkOption {
      type = lib.types.str;
      default = "vivendi-deuteranopia";
      description = "dark theme to use";
    };
    lightTheme = lib.mkOption {
      type = lib.types.str;
      default = "operandi-deuteranopia";
      description = "light theme to use";
    };
    fonts = {
      monospace = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "DejaVu Sans Mono";
          description = "monospace font to use";
        };
        package = lib.mkPackageOption pkgs pkgs.dejavu_fonts;
      };
      size = lib.mkOption {
        type = lib.types.float;
        default = 16.0;
        description = "font size";
      };
    };
  };

  imports = themeLib.applyToModules themeModules;
}
