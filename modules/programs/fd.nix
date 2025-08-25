#
# Alternative to find, and required by telescope
#
{vars, ...}: {
  home-manager.users.${vars.user} = {
    programs.fd = {
      enable = true;
    };
  };
}
