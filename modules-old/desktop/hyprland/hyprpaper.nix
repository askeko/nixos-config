# Hyprland wallpaper utility
{ config, lib, pkgs, vars, host, ... }:

with lib;
with host;
{
  config = mkIf (config.hyprland.enable) 
    {
      home-manager.users.${vars.user} = {
        services.hyprpaper = {
          enable = true;
          settings = {
            preload = [ "/home/askeko/Pictures/Wallpapers/slick/muscle-car-ice-road-red-moon.jpg" ];
            wallpaper = [ ",/home/askeko/Pictures/Wallpapers/slick/muscle-car-ice-road-red-moon.jpg" ];
          };
        };
      };
    };
}

