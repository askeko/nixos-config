{
  pkgs,
  vars,
  ...
}: {
  home-manager.users.${vars.user} = {
    home.packages = with pkgs; [
      nautilus
    ];

    programs.yazi = {
      enable = true;
    };
  };
}
