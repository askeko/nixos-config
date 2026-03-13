{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    # Fix gamescope inside steam
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    # TODO: move mango to home-manager
    mangohud
    rusty-path-of-building
  ];
}
