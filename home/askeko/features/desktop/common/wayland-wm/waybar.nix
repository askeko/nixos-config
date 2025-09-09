#
#  Bar for wayland
#
{
  programs.waybar = {
    enable = true;
    style = ''
      /* One Dark Theme */
      @define-color background        #282c34;
      @define-color background_alt    #333842;
      @define-color foreground        #abb2bf;
      @define-color blue              #61afef;
      @define-color blue_alt          #8fc6f4;
      @define-color cyan              #56b6c2;
      @define-color cyan_alt          #7bc6d0;
      @define-color magenta           #c678dd;
      @define-color magenta_alt       #d7a1e7;
      @define-color yellow            #e5c07b;
      @define-color yellow_alt        #edd4a6;
      @define-color green             #98c379;
      @define-color green_alt         #b3d39c;
      @define-color red               #e06c75;
      @define-color white             #abb2bf;
      @define-color orange            #cc9057;

      @define-color grey              #535965;
      @define-color light_grey        #7a818e;

      @keyframes blink {
        to {
          background-color: @red;
        }
      }

      * {
        font-family:
          Symbols Nerd Font,
          FiraCode Nerd Font Mono;
        font-size: 15px;
        min-height: 0;
        margin-top: 1px;
      }

      #temperature,
      #cpu,
      #memory,
      #disk,
      #network,
      #custom-pacman,
      #custom-music,
      #tray,
      #backlight,
      #clock,
      #battery,
      #wireplumber,
      #custom-scrot {
        background-color: @background;
        padding: 0.5rem 0.8rem;
        margin: 8px 0;
      }

      #waybar {
        background: transparent;
        color: @background;
      }

      #workspaces {
        background-color: @background;
        border-radius: 2rem;
        margin: 8px;
        margin-left: 1rem;
      }

      #workspaces button {
        color: @magenta;
        border-radius: 1rem;
        padding: 0.4rem;
      }

      #workspaces button.empty {
        color: @foreground;
        border-radius: 1rem;
      }

      #workspaces button.active {
        color: @blue;
        border-radius: 1rem;
      }

      #workspaces button:hover {
        color: @magenta_alt;
        border-radius: 1rem;
      }

      #workspaces button.urgent {
        color: @magenta;
        border-radius: 1rem;
        animation-name: blink;
        animation-duration: 1s;
        animation-timing-function: steps(200);
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #temperature {
        color: @yellow;
        border-radius: 1rem 0px 0px 1rem;
        margin-left: 1rem;
      }

      #temperature.critical {
        animation-name: blink;
        animation-duration: 1s;
        animation-timing-function: steps(200);
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #cpu {
        color: @magenta;
      }

      #memory {
        color: @cyan;
      }

      #disk {
        color: @blue;
        border-radius: 0px 1rem 1rem 0px;
        margin-right: 1rem;
      }

      #network {
        color: @magenta;
      }

      #custom-pacman {
        color: @orange;
        border-radius: 1rem 0px 0px 1rem;
        margin-left: 1rem;
      }

      #clock {
        color: @blue;
        border-radius: 0px 1rem 1rem 0px;
        margin-right: 1rem;
      }

      #battery {
        color: @cyan;
      }

      #battery.critical:not(.charging) {
        animation-name: blink;
        animation-duration: 1s;
        animation-timing-function: steps(200);
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #backlight {
        color: @yellow;
      }

      #wireplumber {
        color: @green;
      }

      #wireplumber.muted {
        color: @background;
        background-color: @red;
      }

      #custom-music {
        color: @cyan_alt;
        border-radius: 1rem;
      }

      #custom-scrot {
        margin-right: 1rem;
        border-radius: 1rem;
        color: @green;
      }

      #tray {
        margin-right: 1rem;
        border-radius: 1rem;
      }
    '';
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
}
