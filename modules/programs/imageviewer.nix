{
  pkgs,
  lib,
  config,
  vars,
  ...
}:
with lib; {
  config = mkIf config.waylandwm.enable {
    home-manager.users.${vars.user} = {
      home.packages = with pkgs; [
        vimiv-qt
      ];
    };
  };
}
