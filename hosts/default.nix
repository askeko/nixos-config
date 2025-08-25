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

{ inputs, nixpkgs, home-manager, vars, ... }:

{
  laptop = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";                    # System architecture
    specialArgs = {
      inherit inputs vars;
      host = {
        hostName = "laptop";
	mainMonitor = "eDP-1";
	secondMonitor = "";
      };
    };
    modules = [
      inputs.nvf.nixosModules.default
      ./laptop
      ./configuration.nix

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
	home-manager.useUserPackages = true;
      }
    ];
  };
}
