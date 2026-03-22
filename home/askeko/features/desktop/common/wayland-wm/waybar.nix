#
#  Bar for wayland
#
{pkgs, ...}: {
  home.packages = with pkgs; [
    lm_sensors # dependency of temp module
    playerctl # dependency of music module
  ];
  programs.waybar = {
    enable = true;
    style =
      /*
      css
      */
      ''

        @import url("/home/askeko/.config/theme/current/waybar.css");

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
          margin-top: 0px;
        }

        #custom-temperature,
        #cpu,
        #memory,
        #disk,
        #network,
        #custom-nix,
        #custom-music,
        #tray,
        #custom-backlight,
        #clock,
        #custom-battery,
        #wireplumber,
        #custom-scrot {
          background-color: @background;
          padding: 0.5rem 0.8rem;
          margin: 8px 0 0 0;
        }

        #waybar {
          background: transparent;
          color: @background;
        }

        #workspaces {
          background-color: @background;
          border-radius: 1rem;
          margin: 8px;
          margin-left: 1rem;
          margin-bottom: 0;
          padding-left: 8px;
          padding-right: 8px;
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
          color: @magenta;
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

        #custom-temperature {
          color: @yellow;
          border-radius: 1rem 0px 0px 1rem;
          margin-left: 1rem;
        }

        #custom-temperature.critical {
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

        #custom-nix {
          color: @orange;
          border-radius: 1rem 0px 0px 1rem;
          margin-left: 1rem;
        }

        #clock {
          color: @blue;
          border-radius: 0px 1rem 1rem 0px;
          margin-right: 1rem;
        }

        #custom-battery {
          color: @cyan;
        }

        #custom-battery.critical {
          animation-name: blink;
          animation-duration: 1s;
          animation-timing-function: steps(200);
          animation-iteration-count: infinite;
          animation-direction: alternate;
        }

        #custom-backlight {
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
          color: @cyan;
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
        modules-left = [
          "hyprland/workspaces"
          "custom/temperature"
          "cpu"
          "memory"
          "disk"
        ];
        modules-center = ["custom/music"];
        modules-right = [
          "custom/nix"
          "custom/backlight"
          "wireplumber"
          "network"
          "custom/battery"
          "clock"
          "tray"
        ];

        "hyprland/workspaces" = {
          active-only = false;
          all-outputs = true;
          show-special = true;
          format = "{icon}";
          format-icons = {
            active = "󱄅";
            persistent = "";
            empty = "";
            urgent = "";
            default = "󱄅";
          };
          persistent-workspaces = {
            "*" = [
              1
              2
              3
              4
              5
              6
              7
              8
              9
              10
            ]; # 10 workspaces by default on every monitor
          };
        };

        tray = {
          icon-size = 18;
          spacing = 10;
        };

        "custom/temperature" = {
          format = "{}";
          interval = 5;
          return-type = "json";
          exec = ''
            temp=$(sensors -j 2>/dev/null | jq '.["k10temp-pci-00c3"].Tctl.temp1_input | round')
            if [ "$temp" -ge 80 ]; then icon="󰸁"; class="critical"
            elif [ "$temp" -ge 60 ]; then icon="󱩿"; class=""
            else icon="󱃃"; class=""
            fi
            echo "{\"text\":\"''${icon} ''${temp}°\", \"class\":\"''${class}\"}"
          '';
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

        "custom/nix" = {
          format = "{}";
          interval = 1800;
          signal = 8;
          exec = ''
            days=$(( ( $(date +%s) - $(stat -c %Y /run/current-system) ) / 86400 ))
            gens=$(ls /nix/var/nix/profiles/ | grep -c "system-[0-9]")
            echo "󰑓 ''${days}d  󰆼 ''${gens}"
          '';
          on-click = "pkill -RTMIN+8 waybar";
        };

        disk = {
          interval = 30;
          format = "󱛟 {used}";
          unit = "GB";
          path = "/";
        };

        "custom/music" = {
          format = " {}";
          escape = true;
          tooltip = false;
          exec = "playerctl --player=playerctld --follow metadata --format='{{ title }}' 2>/dev/null";
          on-click = "playerctl play-pause";
          max-length = 40;
        };

        clock = {
          tooltip = false;
          timezone = "Europe/Copenhagen";
          format = "󰥔 {:%H:%M | %d/%m}";
        };

        "custom/battery" = {
          return-type = "json";
          interval = 30;
          exec-if = "ls /sys/class/power_supply/ | grep -q '^BAT'";
          exec = ''
            capacity=$(cat /sys/class/power_supply/BAT0/capacity)
            status=$(cat /sys/class/power_supply/BAT0/status)
            if [ "$status" = "Charging" ]; then icon="󰂄"
            elif [ "$status" = "Full" ]; then icon="󰚥"
            elif [ "$capacity" -le 10 ]; then icon="󰁺"
            elif [ "$capacity" -le 20 ]; then icon="󰁻"
            elif [ "$capacity" -le 30 ]; then icon="󰁼"
            elif [ "$capacity" -le 40 ]; then icon="󰁽"
            elif [ "$capacity" -le 50 ]; then icon="󰁾"
            elif [ "$capacity" -le 60 ]; then icon="󰁿"
            elif [ "$capacity" -le 70 ]; then icon="󰂀"
            elif [ "$capacity" -le 80 ]; then icon="󰂁"
            elif [ "$capacity" -le 90 ]; then icon="󰂂"
            else icon="󱐋"
            fi
            class=""
            if [ "$status" = "Discharging" ] && [ "$capacity" -le 15 ]; then class="critical"; fi
            echo "{\"text\":\"''${icon} ''${capacity}%\", \"class\":\"''${class}\"}"
          '';
        };

        "custom/backlight" = {
          interval = 2;
          exec-if = "ls /sys/class/backlight/ 2>/dev/null | grep -q .";
          exec = ''
            brightness=$(brightnessctl get)
            max=$(brightnessctl max)
            percent=$(( brightness * 100 / max ))
            if [ "$percent" -le 10 ]; then icon="󱩎"
            elif [ "$percent" -le 20 ]; then icon="󱩏"
            elif [ "$percent" -le 30 ]; then icon="󱩐"
            elif [ "$percent" -le 40 ]; then icon="󱩑"
            elif [ "$percent" -le 50 ]; then icon="󱩒"
            elif [ "$percent" -le 60 ]; then icon="󱩓"
            elif [ "$percent" -le 70 ]; then icon="󱩔"
            elif [ "$percent" -le 80 ]; then icon="󱩕"
            elif [ "$percent" -le 90 ]; then icon="󱩖"
            else icon="󰛨"
            fi
            echo "''${icon}"
          '';
        };

        wireplumber = {
          tooltip = false;
          format = "{icon} {volume}%";
          format-muted = "";
          max-volume = 120;
          format-icons = [
            ""
            ""
            ""
          ];
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
