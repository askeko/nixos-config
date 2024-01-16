# 
# flake.nix *
# |- ./hosts
# | |- default.nix
#

{
  description = "Abs' Flake Configuration";

  inputs = {                                                        # Reference used by flake
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";               # Stable nix packages
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";   # Unstable nix packages

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";      # User environment manager
      inputs.nixpkgs.follows = "nixpkgs";
    
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager }: {             # Function telling flak which inputs to use
    
    let                                                             # Variables used in flake
      vars = {
        user = "askeko";
	location = "$HOME/.setup";
	terminal = "wezterm";
	editor = "nvim";
      };
    in
    {
      nixosConfiguration = (
        import ./hosts {
	  inherit (nixpkgs) lib;
	  inherit inputs nixpkgs nixpkgs-unstable home-manager vars;
	}
      )
    };
  };
}
