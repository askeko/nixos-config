# The notification daemon
{
  config,
  lib,
  vars,
  ...
}: {
  config = (lib.mkIf (config.waylandwm.enable or config.x11wm.enable)) {
    home-manager.users.${vars.user} = {
      services.dunst = {
        enable = true;
      };
    };
  };
}
