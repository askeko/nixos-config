#
#  Specific system configuration settings for shrek
#
{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/users/askeko

    ../common/optional/plasma.nix
    ../common/optional/bluetooth.nix
    ../common/optional/pipewire.nix
    ../common/optional/udisks2.nix
    ../common/optional/nvidia.nix
  ];

  networking = {
    hostName = "shrek";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [
      80 # HTTP
      443 # HTTPS
      3000 # shrek ports
      22 # SSH
    ];
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # Services
  security.sudo.wheelNeedsPassword = false;
  programs.nix-ld.enable = true;
  services.openssh.enable = true;

  # xrdp remote desktop
  services.xrdp = {
    enable = true;
    defaultWindowManager = "startplasma-x11";
    openFirewall = true;
  };

  # System packages not covered by home-manager features
  environment.systemPackages = with pkgs; [
    tldr
    wireguard-tools
    netcat-gnu
  ];

  # Locale settings
  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_DK.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "da_DK.UTF-8";
    LC_IDENTIFICATION = "da_DK.UTF-8";
    LC_MEASUREMENT = "da_DK.UTF-8";
    LC_MONETARY = "da_DK.UTF-8";
    LC_NAME = "da_DK.UTF-8";
    LC_NUMERIC = "da_DK.UTF-8";
    LC_PAPER = "da_DK.UTF-8";
    LC_TELEPHONE = "da_DK.UTF-8";
    LC_TIME = "da_DK.UTF-8";
  };

  services.xserver.xkb.layout = "dk";
  console.keyMap = "dk-latin1";

  system.stateVersion = "25.11";
}
