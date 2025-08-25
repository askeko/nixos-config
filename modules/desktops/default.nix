#
# Desktop Environments and Window Managers
#
#  flake.nix
#   ├─ ./hosts
#   │   └─ configuration.nix
#   └─ ./modules
#       └─ ./desktops
#           ├─ default.nix
#           └─ ...

[
  ./bspwm.nix
  ./hyprland/hyprland.nix
  ./options.nix
]
