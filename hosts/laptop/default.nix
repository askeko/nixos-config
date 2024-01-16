#
#  Specific system configuration settings for laptop
#
#  flake.nix
#   ├─ ./hosts
#   │   ├─ default.nix
#   │   └─ ./laptop
#   │        ├─ default.nix *
#   │        └─ hardware-configuration.nix
#

{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];


  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #laptop.enable = true;                     # Laptop Modules

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver = {
    layout = "dk";
    xkbVariant = "dvorak";
  };

  console.useXkbConfig = true;
}
