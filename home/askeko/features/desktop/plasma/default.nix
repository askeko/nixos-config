{pkgs, ...}: {
  imports = [
    ../common/terminal
    ../common/theme
    ../common/bitwarden.nix
    ../common/discord.nix
    ../common/evince.nix
    ../common/filemanager.nix
    ../common/firefox.nix
    ../common/gtk.nix
    ../common/obsidian.nix
    ../common/pavucontrol.nix
    ../common/spotify.nix
    ../common/udiskie.nix
  ];

  home.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
  ];

  xdg.mimeApps.enable = true;
}
