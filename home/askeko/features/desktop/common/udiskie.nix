{
  pkgs,
  vars,
  ...
}: {
  services = {
    # Remember to enable udisks2 as well with nix option services.udisks2.enable = true;
    udiskie = {
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
