# The notification daemon
{pkgs, ...}: {
  services.dunst = {
    enable = true;
  };
  home.packages = with pkgs; [
    libnotify # To enable apps to communicate with D-Bus interface that dunst uses, and dependency for grimblast
  ];
}
