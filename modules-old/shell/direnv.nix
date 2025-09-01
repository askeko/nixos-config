{ vars, ... }:

{
    home-manager.users.${vars.user} = {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    };
}
