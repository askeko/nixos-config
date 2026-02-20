#
#  Specific system configuration settings for laptop
#
{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./desktop/plasma.nix

    ../common/global
    ../common/users/shrek

    ../common/optional/pipewire.nix
    ../common/optional/udisks2.nix

    ../common/optional/docker.nix
  ];

  networking = {
    hostName = "shrek";
    networkmanager.enable = true;
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    # Get latest linux kernel
    # It fixes suspend on lid close and iio-proxy (accelerometer) issues
    kernelPackages = pkgs.linuxPackages_latest;
  };

  hardware = {
  };

  # Locale settings
  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_DK.UTF-8";

  # Keyboard layout outside of desktop environment
  services.xserver = {
    xkb.layout = "dk";
    xkb.options = "caps:swapescape";
  };

  console.useXkbConfig = true; # Use X keyboard config in tty

  # Settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11";
}
