{
  pkgs,
  lib,
  vars,
  config,
  ...
}:
with lib; {
  config = mkMerge [
    (mkIf config.waylandwm.enable {
      home-manager.users.${vars.user} = {
        home.packages = with pkgs; [
          grim
          grimblast
          hyprpicker
          jq
        ];
      };
    })

    (mkIf config.hyprland.enable {
      home-manager.users.${vars.user} = {
        home.packages = with pkgs; [
          slurp
        ];
      };
    })
  ];
}
