#
# flake.nix *
# |- ./hosts
# | |- default.nix
#
{
  description = "Askeko's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:Bliztle/nvf/emmet-language-server"; # For vim config

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nvf,
    ...
  }: let
    vars = {
      user = "askeko";
      terminal = "kitty";
      browser = "firefox";
    };
  in {
    nixosConfigurations = import ./hosts {
      inherit (nixpkgs) lib;
      inherit inputs nixpkgs home-manager nvf vars;
    };
  };
}
