{ pkgs, ... }:
{
  gtk = {
    enable = true;
  };

  # home.packages = with pkgs; [
  #   everforest-cursors
  # ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.everforest-cursors;
    name = "everforest-cursors";
    size = 32;
  };
}
