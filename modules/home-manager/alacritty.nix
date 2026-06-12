{ themeLib }:
{ config, lib, ... }:
let
  cfg = config.nix-theme.alacritty;
in
{
  options.nix-theme.alacritty = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf (cfg.enable) {
    programs.alacritty.settings = {
      font = {
        normal = {
          family = config.nix-theme.fonts.monospace.name;
          style = "Regular";
        };
        size = config.nix-theme.fonts.size;
      };
      colors = with themeLib.theme.withHashtag; {
        primary = {
          foreground = fg-main;
          background = bg-main;
          bright_foreground = fg-alt;
        };
        selection = {
          text = fg-alt;
          background = bg-active;
        };
        cursor = {
          text = bg-main;
          cursor = bg-active;
        };
        normal = {
          black = bg-main;
          white = fg-main;
          inherit
            red
            green
            yellow
            blue
            magenta
            cyan
            ;
        };
        bright = {
          black = bg-dim;
          white = fg-main;
          red = red-intense;
          green = green-intense;
          yellow = yellow-intense;
          blue = blue-intense;
          magenta = magenta-intense;
          cyan = cyan-intense;
        };
      };
    };
  };
}
