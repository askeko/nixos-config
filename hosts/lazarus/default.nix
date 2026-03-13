#
#  Specific system configuration settings for desktop
#
{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/users/askeko

    ../common/optional/hyprland.nix
    ../common/optional/bluetooth.nix
    ../common/optional/pipewire.nix
    ../common/optional/udisks2.nix
    ../common/optional/nvidia.nix
    ../common/optional/steam.nix

    #    ../common/optional/docker.nix
  ];

  networking = {
    hostName = "lazarus";
    networkmanager.enable = true;
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # Locale settings
  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_DK.UTF-8";

  # Keyboard layout outside of desktop environment
  services.xserver = {
    xkb.layout = "eu";
  };

  console.useXkbConfig = true;

  system.stateVersion = "25.11";
}
