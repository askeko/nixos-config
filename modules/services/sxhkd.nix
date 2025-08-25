#
# Hotkey daemon
#

{ config, lib, vars, ... }:

{
  # TODO: change to bspwm enable instead of x11wm
  config = lib.mkIf (config.x11wm.enable) {
    home-manager.users.${vars.user} = {
      services = {
        sxhkd = {
          enable = true;
          extraOptions = [ "-m -1" ];
	  keybindings = {
            "XF86AudioMute" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

            "super + shift + m" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            
            "XF86AudioLowerVolume" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
            
            "XF86AudioRaiseVolume" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
            
            "XF86AudioMicMute" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
            
            "XF86MonBrightnessDown" = "xbacklight -dec 5";
            
            "XF86MonBrightnessUp" = "xbacklight -inc 5";

            "Print" = "maimp";
            
            # focus or send window to the given desktop
            "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,0}'";
            
            # preselect the ratio of new window
            "super + ctrl + {1-9,0}" = "bspc node -o 0.{1-9}";
            
            "super + plus" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
            
            "super + shift + plus" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 15%+";
            
            "super + q" = "bspc node -c";

            "super + shift + q" = "pwrmenu";
            
            "super + w" = "firefox";
            
            "super + a" = "bspc config window_gap 10";
            	
            "super + shift + a" = "bspc config window_gap 0";
            
            "super + d" = "rofi -show drun";
            
            "super + f" = "bspc node -t \\~fullscreen";
            
            # focus the node in the given direction
            "super + {_,shift + }{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";
            
            # preselect the direction
            "super + ctrl + {h,j,k,l}" = "bspc node -p {west,south,north,east}";
            
            "super + Return" = "${vars.terminal}";

            # change inner gaps
            "super + {_, shift +} less" = "{ bspc config -d focused window_gap $(( $(bspc config -d focused window_gap) + 10 )), \
                [ $(bspc config -d focused window_gap) -ge 10 ] && \
                bspc config -d focused window_gap $(( $(bspc config -d focused window_gap) - 10 )) }";
            
            "super + minus" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
            
            "super + shift + minus" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 15%-";
            
            # Smart resize, will grow or shrink depending on location.
            # Will always grow for floating nodes.
            "super + {Left,Down,Up,Right}" = "n=25; \
            	{ d1=left;   d2=right;  dx=-$n; dy=0;   \
            	, d1=bottom; d2=top;    dx=0;   dy=$n;  \
            	, d1=top;    d2=bottom; dx=0;   dy=-$n; \
            	, d1=right;  d2=left;   dx=$n;  dy=0;   \
            	} \
            	bspc node --resize $d1 $dx $dy || bspc node --resize $d2 $dx $dy";
            
            # move a floating window
            "super + shift + {Left,Down,Up,Right}" = "bspc node -v {-25 0,0 25,0 -25,25 0}";
	  };
	};
      };
    };
  };
}
