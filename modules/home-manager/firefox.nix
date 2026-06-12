{ themeLib }:
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nix-theme.firefox;
in
{
  options.nix-theme.firefox = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf (cfg.enable) {
    programs.firefox.profiles.default =
      let
        mkColor = color: {
          r = color.r;
          g = color.g;
          b = color.b;
        };
      in
      {
        extensions = {
          settings."FirefoxColor@mozilla.com".settings = with themeLib.theme; {
            firstRunDone = true;
            theme = {
              title = "nix-theme ${themeLib.themeName}";
              colors = {
                toolbar = mkColor bg-main;
                toolbar_text = mkColor fg-main;
                frame = mkColor bg-dim;
                tab_background_text = mkColor bg-active;
                toolbar_field = mkColor bg-dim;
                toolbar_field_text = mkColor fg-main;
                tab_line = mkColor fg-alt;
                popup = mkColor bg-main;
                popup_text = mkColor fg-main;
                button_background_active = mkColor bg-inactive;
                frame_inactive = mkColor bg-main;
                icons_attention = mkColor fg-alt;
                icons = mkColor fg-main;
                ntp_background = mkColor bg-main;
                ntp_text = mkColor fg-main;
                popup_border = mkColor fg-alt;
                popup_highlight_text = mkColor fg-main;
                popup_highlight = mkColor bg-inactive;
                sidebar_border = mkColor fg-alt;
                sidebar_highlight_text = mkColor fg-main;
                sidebar_highlight = mkColor fg-alt;
                sidebar_text = mkColor fg-main;
                sidebar = mkColor bg-main;
                tab_background_separator = mkColor fg-alt;
                tab_loading = mkColor fg-main;
                tab_selected = mkColor bg-main;
                tab_text = mkColor fg-main;
                toolbar_bottom_separator = mkColor bg-main;
                toolbar_field_border_focus = mkColor fg-alt;
                toolbar_field_border = mkColor bg-main;
                toolbar_field_focus = mkColor bg-main;
                toolbar_field_highlight_text = mkColor bg-main;
                toolbar_field_highlight = mkColor fg-alt;
                toolbar_field_separator = mkColor fg-alt;
                toolbar_vertical_separator = mkColor fg-alt;
              };
            };
          };
        };
      };
  };
}
