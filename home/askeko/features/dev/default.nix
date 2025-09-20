{ pkgs, ... }:
{
  imports = [
    ./nixvim
  ];
  home.packages = with pkgs; [
    # Haskell
    (haskellPackages.ghcWithPackages (
      pkgs: with pkgs; [
        stack
        cabal-install
      ]
    ))
  ];
}
