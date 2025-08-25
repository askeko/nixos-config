# Binds for Hyprland
{
  config,
  lib,
  vars,
  host,
  ...
}:
with lib;
with host; {
  config =
    mkIf (config.hyprland.enable)
    {
      home-manager.users.${vars.user} = {
        wayland.windowManager.hyprland.settings = {
          exec-once = [
            "waybar"
          ];
        };
      };
    };
}
