#
#  Specific system configuration settings for laptop
#
#  flake.nix
#   ├─ ./hosts
#   │   ├─ default.nix
#   │   └─ ./laptop
#   │       ├─ default.nix *
#   │       └─ hardware-configuration.nix
#   └─ ./modules
#       └─ ./desktops
#           └─ bspwm.nix

{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];


  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.acpilight.enable = true;

  bspwm.enable = true;

  console.useXkbConfig = true;
}
