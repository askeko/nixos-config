{
  inputs,
  outputs,
  ...
}:
let
  vars = {
    terminal = "kitty";
    browser = "firefox";
  };
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./nix.nix
  ];
  home-manager.useGlobalPkgs = true;
  home-manager.extraSpecialArgs = {
    inherit inputs outputs vars;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
