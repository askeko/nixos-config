#
#  Theming configuration
#
{
  pkgs,
  vars,
  ...
}: {
  programs = {
    dconf.enable = true; # Configuration backend for GNOME/GTK
  };

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
        name = "FreeSans";
      };
    };

    qt = {
      enable = true;
      platformTheme.name = "gtk";
      style.name = "adwaita-dark";
      style.package = pkgs.adwaita-qt;
    };
  };

  environment.variables = {
    QT_QPA_PLATFORMTHEME = "gtk2";
  };
}
