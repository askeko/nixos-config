#
# Services
#
#  flake.nix
#   ├─ ./hosts
#   │   └─ configuration.nix
#   └─ ./modules
#       └─ ./desktops
#           ├─ default.nix
#           └─ ...
{
  imports = [
    ./waybar/waybar.nix
    ./audio.nix
    ./bluetooth.nix
    ./dunst.nix
    ./polybar.nix
    ./udiskie.nix
  ];
}
