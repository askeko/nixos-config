#
# hyprland configuration
# Enable with "hyprland.enable = true;"
#
{
  config,
  lib,
  pkgs,
  vars,
  host,
  ...
}:
with lib;
with host; {
  options = {
    hyprland = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  imports = [./apps.nix ./binds.nix ./settings.nix ./windowrules.nix ./hyprpaper.nix];

  config =
    mkIf config.hyprland.enable
    {
      waylandwm.enable = true;

      programs = {
        hyprland = {
          enable = true;
          withUWSM = true; # Recommended way to launch Hyprland for neat integration with systemd
        };
        zsh.enable = true;
      };

      fonts.packages = with pkgs; [
        nerd-fonts.symbols-only
        nerd-fonts.fira-code
      ];

      home-manager.users.${vars.user} = {
        wayland.windowManager.hyprland = {
          enable = true;
          package = pkgs.hyprland;
          xwayland.enable = true;
          systemd.enable = true;
        };
      };
    };
}
