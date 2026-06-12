{ themeLib }:
{ config, lib, ... }:
let
  cfg = config.nix-theme.halloy;
in
{
  options.nix-theme.halloy = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf (cfg.enable) {
    programs.halloy = {
      settings.theme = "nix-theme";
      settings.font = {
        family = config.nix-theme.fonts.monospace.name;
        size = builtins.ceil config.nix-theme.fonts.size;
      };
      themes.nix-theme = with themeLib.theme.withHashtag; {
        general = {
          background = bg-main;
          border = border;
          horizontal_rule = border;
          unread_indicator = red;
        };
        text = {
          primary = fg-main;
          secondary = fg-dim;
          tertiary = fg-alt;
          success = modeline-info;
          error = modeline-err;
        };
        buffer = {
          action = fg-dim;
          background = bg-main;
          background_text_input = bg-dim;
          background_title_bar = bg-dim;
          border = border;
          border_selected = bg-active;
          code = rust;
          highlight = bg-dim;
          nickname = fg-alt;
          selection = fg-dim;
          timestamp = fg-dim;
          topic = fg-dim;
          url = blue;
          server_messages = {
            join = green;
            part = green;
            quit = green;
            default = fg-alt;
          };
        };
        buttons = {
          primary = {
            background = bg-main;
            background_hover = bg-active;
            background_selected = bg-inactive;
            background_selected_hover = cyan;
          };
          secondary = {
            background = bg-dim;
            background_hover = bg-active;
            background_selected = bg-inactive;
            background_selected_hover = cyan;
          };
        };
      };
    };
  };
}
