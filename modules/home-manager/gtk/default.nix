{ themeLib }:
{
  config,
  lib,
  pkgs,
  ...
}:
let

  cfg = config.nix-theme.gtk;

  finalCss = with themeLib.theme.withHashtag; ''
    @define-color accent_color ${blue};
    @define-color accent_bg_color ${blue};
    @define-color accent_fg_color ${bg-main};
    @define-color destructive_color ${red};
    @define-color destructive_bg_color ${red};
    @define-color destructive_fg_color ${bg-main};
    @define-color success_color ${green};
    @define-color success_bg_color ${green};
    @define-color success_fg_color ${bg-main};
    @define-color warning_color ${bg-cyan-intense};
    @define-color warning_bg_color ${bg-cyan-intense};
    @define-color warning_fg_color ${bg-main};
    @define-color error_color ${red};
    @define-color error_bg_color ${red};
    @define-color error_fg_color ${bg-main};
    @define-color window_bg_color ${bg-main};
    @define-color window_fg_color ${fg-dim};
    @define-color view_bg_color ${bg-main};
    @define-color view_fg_color ${fg-dim};
    @define-color headerbar_bg_color ${bg-dim};
    @define-color headerbar_fg_color ${fg-dim};
    @define-color headerbar_border_color rgba(${toString themeLib.theme.bg-dim.r}, ${toString themeLib.theme.bg-dim.g}, ${toString themeLib.theme.bg-dim.b}, 0.7);
    @define-color headerbar_backdrop_color @window_bg_color;
    @define-color headerbar_shade_color rgba(0, 0, 0, 0.07);
    @define-color headerbar_darker_shade_color rgba(0, 0, 0, 0.07);
    @define-color sidebar_bg_color ${bg-dim};
    @define-color sidebar_fg_color ${fg-main};
    @define-color sidebar_backdrop_color @window_bg_color;
    @define-color sidebar_shade_color rgba(0, 0, 0, 0.07);
    @define-color secondary_sidebar_bg_color @sidebar_bg_color;
    @define-color secondary_sidebar_fg_color @sidebar_fg_color;
    @define-color secondary_sidebar_backdrop_color @sidebar_backdrop_color;
    @define-color secondary_sidebar_shade_color @sidebar_shade_color;
    @define-color card_bg_color ${bg-dim};
    @define-color card_fg_color ${fg-dim};
    @define-color card_shade_color rgba(0, 0, 0, 0.07);
    @define-color dialog_bg_color ${bg-dim};
    @define-color dialog_fg_color ${fg-dim};
    @define-color popover_bg_color ${bg-dim};
    @define-color popover_fg_color ${fg-dim};
    @define-color popover_shade_color rgba(0, 0, 0, 0.07);
    @define-color shade_color rgba(0, 0, 0, 0.07);
    @define-color scrollbar_outline_color ${bg-active};
    @define-color blue_1 ${blue};
    @define-color blue_2 ${blue};
    @define-color blue_3 ${blue};
    @define-color blue_4 ${blue};
    @define-color blue_5 ${blue};
    @define-color green_1 ${green};
    @define-color green_2 ${green};
    @define-color green_3 ${green};
    @define-color green_4 ${green};
    @define-color green_5 ${green};
    @define-color yellow_1 ${yellow};
    @define-color yellow_2 ${yellow};
    @define-color yellow_3 ${yellow};
    @define-color yellow_4 ${yellow};
    @define-color yellow_5 ${yellow};
    @define-color orange_1 ${modeline-err};
    @define-color orange_2 ${modeline-err};
    @define-color orange_3 ${modeline-err};
    @define-color orange_4 ${modeline-err};
    @define-color orange_5 ${modeline-err};
    @define-color red_1 ${red};
    @define-color red_2 ${red};
    @define-color red_3 ${red};
    @define-color red_4 ${red};
    @define-color red_5 ${red};
    @define-color purple_1 ${bg-cyan-intense};
    @define-color purple_2 ${bg-cyan-intense};
    @define-color purple_3 ${bg-cyan-intense};
    @define-color purple_4 ${bg-cyan-intense};
    @define-color purple_5 ${bg-cyan-intense};
    @define-color brown_1 ${bg-ochre};
    @define-color brown_2 ${bg-ochre};
    @define-color brown_3 ${bg-ochre};
    @define-color brown_4 ${bg-ochre};
    @define-color brown_5 ${bg-ochre};
    @define-color light_1 ${fg-dim};
    @define-color light_2 ${fg-dim};
    @define-color light_3 ${fg-dim};
    @define-color light_4 ${fg-dim};
    @define-color light_5 ${fg-dim};
    @define-color dark_1 ${fg-dim};
    @define-color dark_2 ${fg-dim};
    @define-color dark_3 ${fg-dim};
    @define-color dark_4 ${fg-dim};
    @define-color dark_5 ${fg-dim};
  '';
in
{
  options.nix-theme.gtk = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf (cfg.enable) {
    gtk.enable = true;
    gtk.theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3";
    };
    gtk.gtk4.theme = config.gtk.theme;

    xdg.configFile = {
      "gtk-3.0/gtk.css".text = finalCss;
      "gtk-4.0/gtk.css".text = finalCss;
    };
  };
}
