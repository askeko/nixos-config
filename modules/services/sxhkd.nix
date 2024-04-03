#
# Hotkey daemon
#

{ config, lib, vars, ... }:

{
  config = lib.mkIf (config.x11wm.enable) {
    home-manager.users.${vars.user} = {
      services = {
        sxhkd = {
          enable = true;
	  keybindings = {
            # Apps
	    "super + Return" = "${vars.terminal}";
	    "super + d" = "rofi -show drun -show-icons";

	    # bspwm
	    "super + {q,k}" = "bspc node -{c,k}";
	    "super + Escape" = "bspc quit";
	    "super + r" = "bspc wm -r";

	    # Nodes
	    "super + {_,shift +}{h,l,k,j}" = "bspc node -{f,s} {west,east,north,south}";
	    # Workspaces
	    "super + {_,shift +}{1-9,0}" = "bspc {desktop -f, node -d} '{1-9,10}'";
	  };
	};
      };
    };
  };
}
