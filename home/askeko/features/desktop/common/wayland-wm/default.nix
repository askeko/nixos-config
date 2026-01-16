{ pkgs, ... }:
{
  imports = [
    ./vimiv.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    QT_QPA_PLATFORM = "wayland";
    LIBSEAT_BACKEND = "logind";
  };

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
}
