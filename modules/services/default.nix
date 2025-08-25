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
[
  ./sxhkd.nix
  ./polybar.nix
  ./rofi.nix
  ./hyprlock.nix
  ./waybar/waybar.nix
  ./dunst.nix
  ./udiskie.nix
  ./sops.nix
]
