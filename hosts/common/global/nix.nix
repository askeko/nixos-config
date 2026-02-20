{
  # Nix settings
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
        "ca-derivations"
      ];
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 9d";
    };
  };
}
