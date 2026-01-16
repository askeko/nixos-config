#
# hyprland configuration
# Enable with "hyprland.enable = true;"
#
{ pkgs, ... }:
let
  scrot = pkgs.writeShellScriptBin "scrot" (builtins.readFile ./scripts/scrot.sh);
  pwrmenu = pkgs.writeShellScriptBin "pwrmenu" (builtins.readFile ./scripts/pwrmenu.sh);
in
{
  imports = [
    ../common/default.nix
    ../common/wayland-wm/default.nix

    ./autostart-tty1.nix
    ./binds.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./settings.nix
  ];

  home.packages = with pkgs; [
    # Screenshot and color picker utilities for Hyprland
    slurp
    grim
    grimblast
    hyprpicker
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
    scrot
    pwrmenu
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    systemd = {
      enable = true;
    };

    settings = {
      exec-once = [
        "waybar"
        "blueman-applet"
      ];
    };
  };
}
