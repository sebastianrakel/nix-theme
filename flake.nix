{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-26.05";
  };

  outputs =
    { self, nixpkgs }:

    let
      inherit (nixpkgs) lib;
    in
    {
      systems = lib.systems.flakeExposed;
      homeModules = {
        default = self.homeModules.nix-theme;
        nix-theme =
          { pkgs, ... }:
          {
            imports = [ ./modules/home-manager ];
          };
      };
    };
}
