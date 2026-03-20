{
  pkgs,
  inputs,
  ...
}: {
  home.packages = [
    inputs.tapaal.packages.${pkgs.stdenv.hostPlatform.system}.tapaal
  ];
}
