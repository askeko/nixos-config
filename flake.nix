# 
# flake.nix *
# |- ./hosts
# | |- default.nix
#

{
  description = "Abs' Flake Configuration";

  inputs = {                                                        
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }: 
    let
      vars = {
        user = "askeko";
	location = "$HOME/.setup";
	terminal = "wezterm";
	editor = "nvim";
      };
    in
    {
      nixosConfigurations = (
        import ./hosts {
	  inherit (nixpkgs) lib;
	  inherit inputs nixpkgs home-manager vars;
	}
      );
    };
}
