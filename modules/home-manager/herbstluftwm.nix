{ themeLib }:
{ config, lib, ... }:
let
  cfg = config.nix-theme.herbstluftwm;
in
{
  options.nix-theme.herbstluftwm = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf (cfg.enable) {
    xdg.configFile."herbstluftwm/theme.sh".text = with themeLib.theme.withHashtag; ''
      herbstclient attr theme.title_font '${config.nix-theme.fonts.monospace.name}:pixelsize=${toString (builtins.ceil config.nix-theme.fonts.size)}'
      herbstclient attr theme.active.color '${bg-active}'
      herbstclient attr theme.title_color '${fg-main}'
      herbstclient attr theme.normal.color '${bg-dim}'
      herbstclient attr theme.urgent.color '${red}'
      herbstclient attr theme.urgent.title_color black
      herbstclient attr theme.tab_color '${bg-inactive}'
      herbstclient attr theme.active.tab_color '${bg-dim}'
      herbstclient attr theme.active.tab_title_color '${fg-main}'
      herbstclient attr theme.normal.title_color '${fg-main}'
      herbstclient attr theme.border_width 0
      herbstclient attr theme.floating.border_width 4
      herbstclient attr theme.floating.outer_width 3
      herbstclient attr theme.floating.outer_color '#2a2a6a'
      herbstclient attr theme.active.inner_color '#789161'
      herbstclient attr theme.urgent.inner_color '#8080ff'
      herbstclient attr theme.normal.inner_color '#c4d5ff'
      herbstclient attr settings.frame_border_active_color '${bg-active}'
      herbstclient attr settings.frame_border_normal_color '${bg-inactive}' 
    '';
  };

}
