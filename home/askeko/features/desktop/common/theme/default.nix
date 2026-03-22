{
  pkgs,
  lib,
  ...
}: let
  theme-switch = pkgs.writeShellScriptBin "theme-switch" (builtins.readFile ./scripts/theme-switch.sh);
  theme-picker = pkgs.writeShellScriptBin "theme-picker" (builtins.readFile ./scripts/theme-picker.sh);
  appearance-picker = pkgs.writeShellScriptBin "appearance-picker" (builtins.readFile ./scripts/appearance-picker.sh);
  wallpaper-picker = pkgs.writeShellScriptBin "wallpaper-picker" (builtins.readFile ./scripts/wallpaper-picker.sh);
  wallpaper-restore = pkgs.writeShellScriptBin "wallpaper-restore" (builtins.readFile ./scripts/wallpaper-restore.sh);
in {
  home.packages = [theme-switch theme-picker appearance-picker wallpaper-picker wallpaper-restore];

  xdg.configFile."theme/palettes" = {
    source = ./palettes;
    recursive = true;
  };

  xdg.configFile."theme/wallpapers" = {
    source = ./wallpapers;
    recursive = true;
  };

  # Populate ~/.config/theme/current/ on activation with persisted or default theme
  home.activation.applyTheme = lib.hm.dag.entryAfter ["linkGeneration"] ''
    ACTIVE="$HOME/.config/theme/active"
    THEME="$(cat "$ACTIVE" 2>/dev/null || true)"
    THEME="''${THEME:-everforest-dark}"
    if [ -f "$HOME/.config/theme/palettes/$THEME" ]; then
      run ${theme-switch}/bin/theme-switch "$THEME"
    else
      run ${theme-switch}/bin/theme-switch everforest-dark
    fi
  '';
}
