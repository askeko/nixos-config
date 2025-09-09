#
#  Lock screen for Hyprland
#
{
  programs.hyprlock = {
    enable = true;
    settings = {
      input-field = [
        {
          monitor = "";
          size = "200, 50";
          outline_thickness = 3;
          dots_size = 0.33; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.15; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = false;
          dots_rounding = -1; # -1 default circle, -2 follow input-field rounding
          outer_color = "rgb(000000)";
          inner_color = "rgb(255, 255, 255)";
          font_color = "rgb(10, 10, 10)";
          fade_on_empty = false;
          fade_timeout = 1000; # Milliseconds before fade_on_empty is triggered.
          placeholder_text = "<i>Input Password...</i>"; # Text rendered in the input box when it's empty.
          hide_input = false;
          rounding = -1; # -1 means complete rounding (circle/oval)
          check_color = "rgb(255, 128, 0)";
          fail_color = "rgb(255, 0, 0)"; # if authentication failed, changes outer_color and fail message color
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>"; # can be set to empty
          fail_transition = 300; # transition time in ms between normal outer_color and fail_color
          capslock_color = -1;
          numlock_color = -1;
          bothlock_color = -1; # when both locks are active. -1 means don't change outer color (same for above)
          invert_numlock = false; # change color if numlock is off
          swap_font_color = false; # see below

          position = "0, -20";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          monitor = "";
          text = "$ATTEMPTS $FAIL";
          text_align = "center"; # center/right or any value for default left. multi-line text alignment inside label container
          color = "rgba(224, 108, 117, 1.0)";
          font_size = 40;
          font_family = "";
          rotate = 0; # degrees, counter-clockwise

          position = "0, -90";
          halign = "center";
          valign = "center";
        }

        {
          monitor = "";
          text = "$TIME";
          text_align = "center"; # center/right or any value for default left. multi-line text alignment inside label container
          color = "rgba(255, 255, 255, 1.0)";
          font_size = 110;
          font_family = "";
          rotate = 0; # degrees, counter-clockwise

          position = "650, -300";
          halign = "center";
          valign = "center";
        }

        {
          monitor = "";

          text = ''
            cmd[update:1000] echo "<span foreground='##ffffff'>$(date +"%a, %d. %b %Y")</span>";
          '';
          text_align = "center"; # center/right or any value for default left. multi-line text alignment inside label container
          color = "rgba(255, 255, 255, 1.0)";
          font_size = 60;
          font_family = "";
          rotate = 0; # degrees, counter-clockwise

          position = "550, -400";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
