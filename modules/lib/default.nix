{
  options,
  config,
  lib,
  ...
}:

let
  inherit (lib)
    flip
    types
    ;

  inherit (lib.modules) importApply;

  currentTheme = (
    {
      "light" = config.nix-theme.lightTheme;
      "dark" = config.nix-theme.darkTheme;
    }
    ."${config.nix-theme.flavor}"
  );

  importJSONTheme = (builtins.fromJSON (builtins.readFile ../../themes/${currentTheme}.json));
in

lib.makeExtensible (ctp: {
  types = {
    flavor = types.enum [
      "light"
      "dark"
    ];
  };

  themeName = currentTheme;

  theme = importJSONTheme // {
    withHashtag = builtins.mapAttrs (key: value: "#" + value.hex) importJSONTheme;
  };

  applyToModules = map (flip importApply { themeLib = ctp; });
})
