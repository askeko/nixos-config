{pkgs, ...}: {
  imports = [
    ./nixvim
    # ./nvf
  ];
  home.packages = with pkgs; [
    # Haskell
    (haskellPackages.ghcWithPackages (
      pkgs:
        with pkgs; [
          haskell-language-server
          stack
          cabal-install
        ]
    ))
  ];
}
