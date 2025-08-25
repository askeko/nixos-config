#
# Modern replacement for ls
#
{vars, ...}: {
  home-manager.users.${vars.user} = {
    programs.eza = {
      enable = true;
    };
  };
}
