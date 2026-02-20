#
# flake.nix *
# |- ./hosts
# | |- default.nix
#
{
  description = "Askeko's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tapaal = {
      url = "github:Bliztle/tapaal-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      # Supported systems
      systems = [ "x86_64-linux" ];

      forEachSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      # Custom packages, accessible through 'nix-build', 'nix-shell', etc.
      # packages = forEachSystems (pkgs: import ./pkgs { inherit pkgs; });
      # Formatter for nix files. Accessible through 'nix fmt'. Use 'alejandra' or 'nixpkgs-fmt'
      formatter = forEachSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
      # Custom packages and modifications, exported as overlays
      #overlays = import ./overlays {inherit inputs;};
      # Reusable nixos modules you might want to export
      # These are usually stuff you would upstream into nixpkgs
      #nixosModules = import ./modules/nixos;
      # Reusable home-manager modules you might want to export
      # These are usually stuff you would upstream into home-manager
      #homeManagerModules = import ./modules/home-manager;

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        # Laptop configuration
        halflight = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            # > Our main nixos configuration file <
            ./hosts/halflight
          ];
        };

        # Uni pc configuration
        shrek = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            # > Our main nixos configuration file <
            ./hosts/shrek
          ];
        };
      };

      # Standalone home-manager configuration entrypoint
      homeConfigurations = {
        # Replace with appropriate username@hostname
        "askeko@absentia" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home/askeko/absentia.nix
          ];
        };
      };
    };
}
