#
#  These are the different profiles that can be used when building NixOS.
#
#  flake.nix
#   └─ ./hosts
#       ├─ default.nix *
#       ├─ configuration.nix
#       └─ ./<host>.nix
#           └─ default.nix
#
{
  inputs,
  nixpkgs,
  home-manager,
  nvf,
  vars,
  ...
}:
# This is where you define host specific configurations
{
  yoga7 = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux"; # System architecture
    specialArgs = {
      inherit inputs vars;
      host = {
        hostName = "halflight"; # The machines hostname
        mainMonitor = "eDP-1"; # The name of the main monitor for use in configs
      };
    };
    modules = [
      nvf.nixosModules.default # Neovim configuration
      ./yoga7/configuration.nix # Host specific configuration

      # Home-Manager configuration
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      }
    ];
  };
}
