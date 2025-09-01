{vars, ...}: {
  home-manager.users.${vars.user} = {
    programs.git = {
      enable = true;
    };
  };
}
