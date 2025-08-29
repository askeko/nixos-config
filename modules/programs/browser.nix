{
  pkgs,
  vars,
  ...
}: let
  browser = pkgs.${vars.browser};
in {
  home-manager.users.${vars.user} = {
    home.packages = [
      browser
    ];
  };
}
