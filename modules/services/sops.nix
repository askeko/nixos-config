{
  config,
  pkgs,
  lib,
  vars,
  ...
}: {
  home-manager.users.${vars.user} = {
    home.packages = with pkgs; [
      sops
      age
    ];
  };
}
