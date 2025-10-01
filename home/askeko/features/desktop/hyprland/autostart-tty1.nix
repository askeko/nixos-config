{ lib, config, ... }:
let
  hyprland = lib.getExe config.wayland.windowManager.hyprland.package;
in
{
  programs.zsh.loginExtra = lib.mkBefore ''
    if [[ "$(tty)" == /dev/tty1 ]]; then
      exec ${hyprland} &> /dev/null
    fi
  '';
}
