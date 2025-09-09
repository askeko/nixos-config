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
#           └─ hyprland.nix
{
  pkgs,
  vars,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/desktop
    ../../modules/dev
    ../../modules/shared
    ../../modules/editors
    ../../modules/programs
    ../../modules/security
    ../../modules/services
    ../../modules/shell
    ../../modules/uni
    ../../modules/theming
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    # Get latest linux kernel
    # It fixes suspend on lid close and iio-proxy (accelerometer) issues
    kernelPackages = pkgs.linuxPackages_latest;
  };

  # User setup
  users.users.${vars.user} = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "video"];
  };

  hardware = {
    acpilight.enable = true; # Brightness control via xbacklight (user must be in video group)
    sensor.iio.enable = true; # Enables accelerometer (This also requires a newer kernel)
  };

  # Settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11";

  # Change this to the desired desktop environment from the desktop modules
  hyprland.enable = true;
}
