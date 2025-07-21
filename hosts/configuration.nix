#  Main system configuration. More information available in configuration.nix(5) man page.
#
#  flake.nix
#   ├─ ./hosts
#   │   ├─ default.nix
#   │   └─ configuration.nix
#   └─ ./modules
#       ├─ ./desktops
#       │   └─ default.nix
#       └─ ./services
#           └─ default.nix
#

{ pkgs, inputs, vars, ... }:

let
  terminal=pkgs.${vars.terminal};
in
{
  imports = (import ../modules/desktops ++
    import ../modules/editors ++
    import ../modules/programs ++
    import ../modules/services ++
    import ../modules/shell ++
    import ../modules/theming);

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  users.users.${vars.user} = {            # System user
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
  };

  time.timeZone = "Europe/Copenhagen";    # Time zone and internationalization
  i18n = {
    defaultLocale = "en_DK.UTF-8";
    extraLocaleSettings = {
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
  };

  # Get latest linux kernel, should possibly be moved to laptop config
  # It fixes suspend on lid close and iio-proxy (accelerometer) issues
  boot.kernelPackages = pkgs.linuxPackages_latest;

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  environment = {
    variables = {
      TERMINAL = "${vars.terminal}";
      EDITOR = "${vars.editor}";
      VISUAL = "${vars.editor}";
    };
    systemPackages = with pkgs; [
      terminal
      wget
      git
      curl
      bitwarden
      neovim
      discord
      firefox
      unzip
      pavucontrol
      obsidian
      evince
      gnome.nautilus
      xournalpp
      ripgrep

      htop
      coreutils
      killall
      xdg-utils
      linux-firmware
      pciutils
    ];
  };

  programs = {
    dconf.enable = true;
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 9d";
    };
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };
  nixpkgs.config.allowUnfree = true;      # Allow proprietary software

  system.stateVersion = "23.11";          # NixOS settings

  home-manager.users.${vars.user} = {     # Home manager settings
    home = {
      stateVersion = "23.11";
      sessionPath = [ "$HOME/.local/bin" "$HOME/.local/bin/scripts"];
    };
    programs = {
      home-manager.enable = true;
    };
    xdg = {
      mime.enable = true;
      mimeApps = {
        enable = true;
      };
    };
  };
}
