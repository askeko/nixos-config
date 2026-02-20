{ pkgs, ... }:
{
  imports = [
    # ./nixvim
    ./nvf
  ];
  home.packages = with pkgs; [
    # Packages required for neovim and plugins go here
  ];
}
