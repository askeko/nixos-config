#
#  GTK
#

{ pkgs, host, vars, ... }:

{
  home-manager.users.${vars.user} = {
    home = {
      file.".local/share/wall.jpg".source = ./wall.jpg;
      pointerCursor = {
        gtk.enable = true;
        name = "Catppuccin-Mocha-Dark-Cursors";
        package = pkgs.catppuccin-cursors.mochaDark;
        size = 16;
      };
    };

    gtk = {
      enable = true;
      theme = {
        name = "Orchis-Dark-Compact";
        package = pkgs.orchis-theme;
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      font = {
        name = "FiraCode Nerd Font Mono Medium";
      };
    };

    qt.enable = true;
    qt.platformTheme = "gtk";
    qt.style.name = "adwaita-dark";
    qt.style.package = pkgs.adwaita-qt;
  };

  environment.variables = {
    QT_QPA_PLATFORMTHEME = "gtk2";
  };
}
