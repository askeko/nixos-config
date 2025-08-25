# 
# Options to enable packages depending on DE/WM. Options are enabled in desktop nix files.
# 

{ lib, ... }:

with lib;
{
  options = {
    # If X11
    x11wm = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };

    waylandwm = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };
}
