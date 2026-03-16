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
    ../common/optional/vpn.nix

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

  # Second SSD (NTFS)
  # Get the UUID with: lsblk -f
  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/5672622A72620F55";
    fsType = "ntfs-3g";
    options = [
      "rw" # Read/write access
      "uid=1000" # Owner is your user
      "gid=100" # Group is 'users'
      "dmask=022" # Directory permissions: 755
      "fmask=133" # File permissions: 644
      "nofail" # Don't block boot if the drive is missing
    ];
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
