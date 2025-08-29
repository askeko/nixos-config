{
  host,
  pkgs,
  vars,
  ...
}: {
  # Nix settings
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 9d";
    };
  };

  # TODO: Not sure if this should be here and if the options are needed
  home-manager.users.${vars.user} = {
    # Home manager settings
    home = {
      # The state version indicates which default settings are in effect and will therefore help
      # avoid breaking program configurations. Switching to a higher state version typically
      # requires performing some manual steps, such as data conversion or moving files.
      stateVersion = "24.11";
      sessionPath = ["$HOME/.local/bin" "$HOME/.local/bin/scripts"];
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

  nixpkgs.config.allowUnfree = true; # Allow proprietary software

  # Shared system packages for all users
  environment = {
    systemPackages = with pkgs; [
      wget
      curl
      unzip
      ripgrep
      coreutils
      neovim
    ];
  };

  # Network setup
  networking.hostName = host.hostName;
  networking.networkmanager.enable = true;

  # Locale settings
  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_DK.UTF-8";

  # Keyboard layout outside of desktop environment
  services.xserver = {
    xkb.layout = "dk";
    xkb.options = "caps:swapescape";
  };

  console.useXkbConfig = true; # Use X keyboard config in tty
}
