{pkgs, ...}: {
  home.packages = with pkgs; [
    uppaal
  ];
}
