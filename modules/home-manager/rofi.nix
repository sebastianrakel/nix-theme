{ themeLib }:
{ config, lib, ... }:
let
  cfg = config.nix-theme.rofi;
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  options.nix-theme.rofi = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf (cfg.enable) {
    programs.rofi.font = "${config.nix-theme.fonts.monospace.name} ${toString (builtins.ceil config.nix-theme.fonts.size)}";
    programs.rofi.theme = with themeLib.theme.withHashtag; {
      "*" = rec {
        red = mkLiteral red-intense;
        blue = mkLiteral blue-intense;
        lightfg = mkLiteral fg-dim;
        lightbg = mkLiteral bg-dim;
        foreground = mkLiteral fg-main;
        background = mkLiteral bg-main;
        background-color = mkLiteral bg-main;
        separatorcolor = mkLiteral "@foreground";
        border-color = mkLiteral "@foreground";
        selected-normal-foreground = mkLiteral "@lightbg";
        selected-normal-background = mkLiteral "@lightfg";
        selected-active-foreground = mkLiteral "@background";
        selected-active-background = mkLiteral "@blue";
        selected-urgent-foreground = mkLiteral "@background";
        selected-urgent-background = mkLiteral "@red";
        normal-foreground = mkLiteral "@foreground";
        normal-background = mkLiteral "@background";
        active-foreground = mkLiteral "@blue";
        active-background = mkLiteral "@background";
        urgent-foreground = mkLiteral "@red";
        urgent-background = mkLiteral "@background";
        alternate-normal-foreground = mkLiteral "@foreground";
        alternate-normal-background = mkLiteral "@lightbg";
        alternate-active-foreground = mkLiteral "@blue";
        alternate-active-background = mkLiteral "@lightbg";
        alternate-urgent-foreground = mkLiteral "@red";
        alternate-urgent-background = mkLiteral "@lightbg";
      };

      window.background-color = mkLiteral "@background";

      message.border-color = mkLiteral "@separatorcolor";

      textbox = {
        text-color = mkLiteral "@normal-foreground";
      };

      listview = {
        border-color = mkLiteral "@separatorcolor";
        spacing = mkLiteral "5px";
      };

      element-text = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      element-icon = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "element normal.normal" = {
        background-color = mkLiteral "@normal-background";
        text-color = mkLiteral "@normal-foreground";
      };
      "element normal.urgent" = {
        background-color = mkLiteral "@urgent-background";
        text-color = mkLiteral "@urgent-foreground";
      };
      "element normal.active" = {
        background-color = mkLiteral "@active-background";
        text-color = mkLiteral "@active-foreground";
      };

      "element selected.normal" = {
        background-color = mkLiteral "@selected-normal-background";
        text-color = mkLiteral "@selected-normal-foreground";
      };
      "element selected.urgent" = {
        background-color = mkLiteral "@selected-urgent-background";
        text-color = mkLiteral "@selected-urgent-foreground";
      };
      "element selected.active" = {
        background-color = mkLiteral "@selected-active-background";
        text-color = mkLiteral "@selected-active-foreground";
      };

      "element alternate.normal" = {
        background-color = mkLiteral "@alternate-normal-background";
        text-color = mkLiteral "@alternate-normal-foreground";
      };
      "element alternate.urgent" = {
        background-color = mkLiteral "@alternate-urgent-background";
        text-color = mkLiteral "@alternate-urgent-foreground";
      };
      "element alternate.active" = {
        background-color = mkLiteral "@alternate-active-background";
        text-color = mkLiteral "@alternate-active-foreground";
      };

      scrollbar.handle-color = mkLiteral "@normal-foreground";
      sidebar.border-color = mkLiteral "@separatorcolor";
      button.text-color = mkLiteral "@normal-foreground";
      "button selected" = {
        background-color = mkLiteral "@selected-normal-background";
        text-color = mkLiteral "@selected-normal-foreground";
      };

      inputbar.text-color = mkLiteral "@normal-foreground";
      case-indicator.text-color = mkLiteral "@normal-foreground";
      entry = {
        text-color = mkLiteral "@normal-foreground";
        placeholder = "Type to filter";
        padding = mkLiteral "0 0 0 10";
      };
      prompt.text-color = mkLiteral "@normal-foreground";

      textbox-prompt-colon.text-color = mkLiteral "inherit";

      mainbox = {
        border = 2;
        padding = 5;
      };
    };
  };
}
