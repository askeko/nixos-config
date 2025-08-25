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
    mkIf config.hyprland.enable
    {
      home-manager.users.${vars.user} = {
        wayland.windowManager.hyprland.settings = {
          "$mainMod" = "SUPER";
          # Keyboard binds
          bind = [
            #########################
            #### WINDOW COMMANDS ####
            #########################

            # Close window (Not kill)
            "$mainMod, Q, killactive,"

            # Move focus with mainMod + vim keys
            "$mainMod, H, movefocus, l"
            "$mainMod, L, movefocus, r"
            "$mainMod, K, movefocus, u"
            "$mainMod, J, movefocus, d"

            # Move window with mainMod + vim keys
            "$mainMod SHIFT, H, movewindow, l"
            "$mainMod SHIFT, L, movewindow, r"
            "$mainMod SHIFT, K, movewindow, u"
            "$mainMod SHIFT, J, movewindow, d"

            # Split orientation
            "$mainMod, S, togglesplit"

            # Toggle fullscreen, with (F) or without (Shift+F) gaps
            "$mainMod, F, fullscreen, 0"

            # Floating window operations
            "$mainMod, space, togglefloating"
            "$mainMod SHIFT, space, centerwindow"
            "$mainMod CTRL, space, pin"

            "$mainMod CTRL SHIFT, H, moveactive, -50 0"
            "$mainMod CTRL SHIFT, L, moveactive, 50 0"
            "$mainMod CTRL SHIFT, K, moveactive, 0 -50"
            "$mainMod CTRL SHIFT, J, moveactive, 0 50"

            # Resize window
            "$mainMod CTRL, H, resizeactive, -50 0"
            "$mainMod CTRL, L, resizeactive, 50 0"
            "$mainMod CTRL, K, resizeactive, 0 -50"
            "$mainMod CTRL, J, resizeactive, 0 50"

            ######################
            ##### WORKSPACES #####
            ######################

            # Switch workspaces with mainMod + [0-9]
            "$mainMod, 1, workspace, 1"
            "$mainMod, 2, workspace, 2"
            "$mainMod, 3, workspace, 3"
            "$mainMod, 4, workspace, 4"
            "$mainMod, 5, workspace, 5"
            "$mainMod, 6, workspace, 6"
            "$mainMod, 7, workspace, 7"
            "$mainMod, 8, workspace, 8"
            "$mainMod, 9, workspace, 9"
            "$mainMod, 0, workspace, 10"

            # Move active window to workspace with mainMod + SHIFT + [0-9]
            "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
            "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
            "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
            "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
            "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
            "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
            "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
            "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
            "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
            "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

            ##################
            ####   BAR    ####
            ##################
            "$mainMod, B, exec, pkill -SIGUSR2 waybar" # Restart bar
            "$mainMod SHIFT, B, exec, pkill -SIGUSR1 waybar" # Toggle bar on/off

            ##################
            ####  SYSTEM  ####
            ##################
            ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
            ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

            #",XF86MonBrightnessUp, exec, brightnessctl set +10%"
            #",XF86MonBrightnessDown, exec, brightnessctl set 10%-"

            ##################
            #### PROGRAMS ####
            ##################
            "$mainMod, RETURN, exec, ${vars.terminal}"
            "$mainMod, W, exec, ${vars.browser}"
            "$mainMod, D, exec, rofi -show drun"
          ];
          # Mouse binds
          bindm = [
            # Move/resize windows with mainMod + LMB/RMB and dragging
            "$mainMod, mouse:272, movewindow"
            "$mainMod, mouse:273, resizewindow"
          ];
        };
      };
    };
}
