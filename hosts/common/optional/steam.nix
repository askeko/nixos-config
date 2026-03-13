{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    # Fix gamescope inside steam
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
  ];
}
