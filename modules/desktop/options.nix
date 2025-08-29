#
# Options to enable packages depending on DE/WM. Options are enabled in desktop nix files.
#
{lib, ...}:
with lib; {
  # Options for other programs to be enabled depending on DE/WM
  options = {
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
