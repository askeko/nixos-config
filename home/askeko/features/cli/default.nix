{ pkgs, ... }:
{
  imports = [
    ./bat.nix
    ./btop.nix
    ./direnv.nix
    ./git.nix
    ./yazi.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    wget # For downloading files
    curl # For transferring data with URLs
    unzip # For extracting zip files
    coreutils # Basic utilities

    # TODO: Some of these should be moved
    killall
    xdg-utils
    xdg-user-dirs
    wev # Wayland event viewer
    wl-clipboard # Clipboard manager for Wayland and dependency for grimblast
  ];

  programs = {
    fd.enable = true; # Better find
    eza.enable = true; # Better ls
    ripgrep.enable = true; # Better grep
  };
}
