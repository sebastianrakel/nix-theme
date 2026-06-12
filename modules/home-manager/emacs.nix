{ themeLib }:
{ config, lib, ... }:
let
  cfg = config.nix-theme.emacs;
  theme =
    {
      "light" = "'modus-operandi-deuteranopia";
      "dark" = "'modus-vivendi-deuteranopia";
    }
    ."${config.nix-theme.flavor}";
in
{
  options.nix-theme.emacs = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf (cfg.enable) {
    home.file.".emacs.d/theme.el".text = ''
      (load-theme ${theme})
    '';

    home.file.".emacs.d/font.el".text = ''
      (add-to-list 'default-frame-alist
             '(font . "${config.nix-theme.fonts.monospace.name}-${toString (builtins.ceil config.nix-theme.fonts.size)}"))
    '';
  };
}
