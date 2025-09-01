{
  imports = [./bitwarden.nix];
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };
}
