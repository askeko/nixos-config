{ config, pkgs, ... }:
let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  # User setup
  users.users.shrek = {
    isNormalUser = true;
    extraGroups = ifTheyExist [
      "wheel"
      "networkmanager"
      "video"
    ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  home-manager.users.askeko = import ../../../../home/askeko/${config.networking.hostName}.nix;
}
