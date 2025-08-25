#
# Terminal file manager
#
{vars, ...}: {
  home-manager.users.${vars.user} = {
    programs.yazi = {
      enable = true;
    };
  };
}
