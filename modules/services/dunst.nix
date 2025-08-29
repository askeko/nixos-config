# The notification daemon
{
  config,
  lib,
  pkgs,
  vars,
  ...
}: {
  config = (lib.mkIf (config.waylandwm.enable or config.x11wm.enable)) {
    home-manager.users.${vars.user} = {
      services.dunst = {
        enable = true;
      };
      home.packages = with pkgs; [
        libnotify # To enable apps to communicate with D-Bus interface that dunst uses, and dependency for grimblast
      ];
    };
  };
}
