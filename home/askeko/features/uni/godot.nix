{ pkgs, ... }:
{
  home.packages = with pkgs; [
    godot-mono
  ];
}
