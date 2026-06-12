{ themeLib }:
{ config, lib, ... }:
let
  cfg = config.nix-theme.tmux;
in
{
  options.nix-theme.tmux = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf (cfg.enable) {
    programs.tmux.extraConfig = ''
      source-file "~/.config/tmux/theme.conf"
    '';
    xdg.configFile."tmux/theme.conf".text = with themeLib.theme.withHashtag; ''
      # default statusbar colors
      set-option -g status-style "fg=${fg-main},bg=${bg-main}"

      # default window title colors
      set-window-option -g window-status-style "fg=${fg-main},bg=${bg-main}"

      # active window title colors
      set-window-option -g window-status-current-style "fg=${fg-dim},bg=${bg-main}"

      # pane border
      set-option -g pane-border-style "fg=${border}"
      set-option -g pane-active-border-style "fg=${fg-dim}"

      # message text
      set-option -g message-style "fg=${fg-dim},bg=${bg-dim}"

      # pane number display
      set-option -g display-panes-active-colour "${bg-active}"
      set-option -g display-panes-colour "${bg-inactive}"

      # clock
      set-window-option -g clock-mode-colour "${blue}"

      # copy mode highlight
      set-window-option -g mode-style "fg=${fg-dim},bg=${bg-dim}"

      # bell
      set-window-option -g window-status-bell-style "fg=${bg-main},bg=${red-faint}"

      # style for window titles with activity
      set-window-option -g window-status-activity-style "fg=${fg-dim},bg=${bg-main}"

      # style for command messages
      set-option -g message-command-style "fg=${fg-main},bg=${bg-dim}"

      set-option -g status "on"
      set-option -g status-justify "left"
      set-option -g status-left "#[fg=${fg-main},bg=${bg-dim}] #S #[fg=${fg-dim},bg=${bg-main},nobold,noitalics,nounderscore]"
      set-option -g status-left-length "80"
      set-option -g status-left-style none
      set-option -g status-right "#[fg=${fg-dim},bg=${bg-main} nobold, nounderscore, noitalics]#[fg=${fg-main},bg=${bg-dim}] %Y-%m-%d  %H:%M #[fg=${fg-main},bg=${bg-dim},nobold,noitalics,nounderscore]#[fg=${bg-main},bg=${fg-main}] #h "
      set-option -g status-right-length "80"
      set-option -g status-right-style none
      set-window-option -g window-status-current-format "#[fg=${bg-main},bg=${red-faint},nobold,noitalics,nounderscore]#[fg=${bg-dim},bg=${red-faint}] #I #[fg=${bg-dim},bg=${red-faint},bold] #W#{?window_zoomed_flag,*Z,} #[fg=${red-faint},bg=${bg-main},nobold,noitalics,nounderscore]"
      set-window-option -g window-status-format "#[fg=${bg-main},bg=${fg-dim},noitalics]#[fg=${fg-main},bg=${bg-dim}] #I #[fg=${fg-main},bg=${bg-dim}] #W#{?window_zoomed_flag,*Z,} #[fg=${fg-dim},bg=${bg-main},noitalics]"
      set-window-option -g window-status-separator ""
    '';
  };

}
