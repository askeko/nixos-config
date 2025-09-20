#
# hyprland configuration
# Enable with "hyprland.enable = true;"
#
{ pkgs, ... }:
{
  imports = [
    ../common/default.nix
    ../common/wayland-wm/default.nix

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
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      exec-once = [
        "waybar"
      ];
    };
  };
}
