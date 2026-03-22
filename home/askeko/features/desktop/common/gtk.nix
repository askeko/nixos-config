{pkgs, ...}: {
  gtk = {
    enable = true;
  };

  home.packages = with pkgs; [
    phinger-cursors # for flexoki-dark theme
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.everforest-cursors;
    name = "everforest-cursors";
    size = 32;
  };
}
