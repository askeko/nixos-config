#
# Cat replacement with syntax highlighting and Git integration
#
{vars, ...}: {
  home-manager.users.${vars.user} = {
    programs.bat = {
      enable = true;
    };
  };
}
