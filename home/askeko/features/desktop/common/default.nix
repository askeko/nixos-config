{
  imports = [
    ./terminal
    ./bitwarden.nix
    ./discord.nix
    ./dunst.nix
    ./evince.nix
    ./filemanager.nix
    ./firefox.nix
    ./gtk.nix
    ./obsidian.nix
    ./pavucontrol.nix
    ./rofi.nix
    ./spotify.nix
    ./udiskie.nix
  ];

  xdg.mimeApps.enable = true;
}
