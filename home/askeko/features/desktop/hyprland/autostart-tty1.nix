{ lib, ... }:
{
  programs.zsh.loginExtra = lib.mkBefore ''
    if [[ "$(tty)" == /dev/tty1 ]]; then
      exec start-hyprland &> /dev/null
    fi
  '';
}
