# Automounting tool for removable drives
{
  vars,
  pkgs,
  ...
}: {
  home-manager.users.${vars.user} = {
    services.udiskie = {
      enable = true;
      settings = {
        # workaround for
        # https://github.com/nix-community/home-manager/issues/632
        program_options = {
          # replace with your favorite file manager
          file_manager = "${pkgs.${vars.terminal}}/bin/${vars.terminal} -e ${pkgs.yazi}/bin/yazi";
        };
      };
    };
  };
}
