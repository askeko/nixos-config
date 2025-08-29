#
#  Bar
#
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
    mkIf config.waylandwm.enable
    {
      home-manager.users.${vars.user} = {
        programs.waybar = {
          enable = true;
          style = concatStringsSep "\n" [(import ./styles/onedark.nix) (import ./styles/style.nix)];
          settings = {
            mainBar = {
              layer = "top"; # Waybar at top layer
              position = "top"; # Waybar position (top|bottom|left|right)

              # Choose the order of the modules
              modules-left = ["hyprland/workspaces" "temperature" "cpu" "memory" "disk"];
              modules-center = ["custom/music"];
              modules-right = ["custom/pacman" "backlight" "wireplumber" "network" "battery" "clock" "tray"];

              "hyprland/workspaces" = {
                active-only = false;
                all-outputs = true;
                show-special = true;
                format = "{icon}";
                format-icons = {
                  active = "󰣇";
                  persistent = "";
                  empty = "";
                  urgent = "";
                  default = "󰣇";
                };
                persistent-workspaces = {
                  "*" = 10; # 10 workspaces by default on every monitor
                };
              };

              tray = {
                icon-size = 18;
                spacing = 10;
              };

              temperature = {
                critical-threshold = 80;
                format-critical = "{icon} {temperatureC}°";
                format = "{icon} {temperatureC}°";
                format-icons = ["󱃃" "󱩿" "󰸁"];
              };

              cpu = {
                format = "󰻠 {usage}%";
              };

              memory = {
                format = "󰍛 {}%";
              };

              network = {
                format-wifi = "󰘊 {signalStrength}%";
                format-ethernet = "󰈀";
                tooltip-format = "󰈀 {ifname} via {gwaddr}";
                format-disconnected = "󰞃 Disconnected";
              };

              "custom/pacman" = {
                format = "{}  ";
                interval = 1800; # every half hour
                exec = "checkupdates | wc -l"; # num of updates
                exec-if = "exit 0"; # always run; consider advanced run conditions
              };

              backlight = {
                format = "{icon}";
                format-icons = ["󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨"];
              };

              disk = {
                interval = 30;
                format = "󱛟 {used}";
                unit = "GB";
                path = "/";
              };

              "custom/music" = {
                format = "  {}";
                escape = true;
                interval = 5;
                tooltip = false;
                exec = "playerctl metadata --format='{{ title }}'";
                on-click = "playerctl play-pause";
                max-length = 40;
              };

              clock = {
                tooltip = false;
                timezone = "Europe/Copenhagen";
                format = "󰥔 {:%H:%M | %d/%m}";
              };

              battery = {
                tooltip = false;
                full-at = 99;
                states = {
                  critical = 15;
                };
                format = "{icon} {capacity}%";
                format-charging = "󰂄 {capacity}%";
                format-plugged = "󰚥 {capacity}%";
                format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󱐋"];
              };

              wireplumber = {
                tooltip = false;
                format = "{icon} {volume}%";
                format-muted = "";
                max-volume = 120;
                format-icons = ["" "" ""];
              };

              "custom/scrot" = {
                tooltip = false;
                on-click = "";
                format = "";
              };
            };
          };
        };
      };
    };
}
