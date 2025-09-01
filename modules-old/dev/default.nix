{
  pkgs,
  vars,
  ...
}: {
  imports = [
    ./git.nix
  ];
  home-manager.users.${vars.user} = {
    home.packages = with pkgs; [
      (haskellPackages.ghcWithPackages (pkgs:
        with pkgs; [
          stack
          cabal-install
        ]))
    ];
  };
}
