{
  imports = [
    ./terminal
    ./bitwarden.nix
    ./discord.nix
    ./dunst.nix
    ./evince.nix
    ./filemanager.nix
    ./firefox.nix
    ./obsidian.nix
    ./pavucontrol.nix
    ./rofi.nix
    ./udiskie.nix
  ];

  xdg.mimeApps.enable = true;
}
