{
  pkgs,
  vars,
  ...
}: {
  home-manager.users.${vars.user} = {
    home.packages = with pkgs; [
      killall
      xdg-utils
      xdg-user-dirs
      wev # Wayland event viewer
      wl-clipboard # Clipboard manager for Wayland and dependency for grimblast
    ];

    programs = {
      fd = {
        enable = true;
      };
      eza = {
        enable = true;
      };
    };
  };
}
