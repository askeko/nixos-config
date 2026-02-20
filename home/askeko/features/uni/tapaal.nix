{
  pkgs,
  inputs,
  ...
}:
{
  home.packages = [
    inputs.tapaal.packages.${pkgs.system}.tapaal
  ];
}
