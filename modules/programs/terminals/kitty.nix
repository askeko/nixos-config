{vars, ...}: {
  home-manager.users.${vars.user} = {
    programs.kitty = {
      enable = true;
    };
  };
}
