#
# Menu launcher, now working for both Wayland and X11
#
{vars, ...}: {
  home-manager.users.${vars.user} = {
    programs = {
      rofi = {
        enable = true;
      };
    };
  };
}
