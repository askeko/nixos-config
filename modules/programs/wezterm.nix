#
# Terminal emulator
#
{ vars, ... }:

let
  colors = import ../theming/colors.nix;
in
{
  home-manager.users.${vars.user} = {
    programs = {
      wezterm = {
        enable = true;               
        enableZshIntegration = true;
        extraConfig = ''return {
  color_scheme = "Tokyo Night",
  hide_tab_bar_if_only_one_tab = true
  }'';
      };
    };
  };
}
