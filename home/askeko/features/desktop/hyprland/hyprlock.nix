#
#  Lock screen for Hyprland
#
{
  programs.hyprlock = {
    enable = true;
    settings = {
      source = "~/.config/theme/current/hyprlock.conf";

      background = [
        {
          monitor = "";
          path = "~/.config/theme/current/wallpaper";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "200, 50";
          outline_thickness = 3;
          dots_size = 0.33;
          dots_spacing = 0.15;
          dots_center = false;
          dots_rounding = -1;
          outer_color = "$outer_color";
          inner_color = "$inner_color";
          font_color = "$font_color";
          fade_on_empty = false;
          fade_timeout = 1000;
          placeholder_text = "<i>Input Password...</i>";
          hide_input = false;
          rounding = -1;
          check_color = "$check_color";
          fail_color = "$fail_color";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          fail_transition = 300;
          capslock_color = -1;
          numlock_color = -1;
          bothlock_color = -1;
          invert_numlock = false;
          swap_font_color = false;

          position = "0, -20";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          monitor = "";
          text = "$ATTEMPTS $FAIL";
          text_align = "center";
          color = "$fail_color";
          font_size = 40;
          font_family = "";
          rotate = 0;

          position = "0, -90";
          halign = "center";
          valign = "center";
        }

        {
          monitor = "";
          text = "$TIME";
          text_align = "center";
          color = "$text_color";
          font_size = 110;
          font_family = "";
          rotate = 0;

          position = "650, -300";
          halign = "center";
          valign = "center";
        }

        {
          monitor = "";

          text = ''
            cmd[update:1000] echo "<span foreground='##$(cat ~/.config/theme/current/fg-color)'>$(date +"%a, %d. %b %Y")</span>";
          '';
          text_align = "center";
          color = "$text_color";
          font_size = 60;
          font_family = "";
          rotate = 0;

          position = "550, -400";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
