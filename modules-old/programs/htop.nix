{vars, ...}: {
  home-manager.users.${vars.user} = {
    programs.htop = {
      enable = true;
    };
  };
}
