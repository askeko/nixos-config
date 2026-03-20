{pkgs, ...}: {
  imports = [
    # ./nixvim
    ./nvf
    ./claude.nix
  ];
  home.packages = with pkgs; [
    # Packages required for neovim and plugins go here
  ];
}
