# 
# bspwm configuration
# Enable with "bspwm.enable = true;"
#

{ config, lib, pkgs, vars, host, ... }:

with lib;
with host;
let 
  extra = ''
    killall -q polybar &
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1;done

    bspc monitor -d 1 2 3 4 5 6 7 8 9 0
    
    bspc config border_width         3
    bspc config window_gap          10
    
    bspc config split_ratio         	 0.55
    bspc config borderless_monocle  	 true
    bspc config gapless_monocle     	 true
    bspc config pointer_follows_focus    false
    bspc config focus_follows_pointer	 true
    
    bspc rule -a Gimp desktop='^8' state=floating follow=on
    bspc rule -a Chromium desktop='^2'
    bspc rule -a mplayer2 state=floating
    bspc rule -a Kupfer.py focus=on
    bspc rule -a Screenkey manage=off
    
    # Border
    bspc config focused_border_color        "#b4befe"
    bspc config normal_border_color         "#6c7086"
    bspc config active_border_color         "#6c7086"

    # Cursor in bspwm
    xsetroot -cursor_name left_ptr

    # Wallpaper
    feh --bg-scale $HOME/.local/share/wall.jpg

    polybar main & #2>~/log &
  '';

  extraConf = "${extra}";
in
{
  options = {
    bspwm = {
      enable = mkOption {
        type = types.bool;
	default = false;
      };
    };
  };

  config = mkIf (config.bspwm.enable) 
    {
      x11wm.enable = true;

      services = {
        xserver = {
          enable = true;
        
          layout = "dk";
	  xkbModel = "pc105";
	  xkbOptions = "caps:escape";
	  libinput = {
            enable = true;
	  };

	  displayManager = {
            defaultSession = "default";
	    session = [
	      {
          manage = "desktop";
	        name = "default";
	        start  = ''exec bspwm'';
	      }
	    ];
	    lightdm = {
              enable = true;
	      greeters.slick.enable = true;
	      background = ../theming/wall.jpg;
	    };
	  };
	 # displayManager = {
         #   defaultSession = "none+bspwm";
	 #   lightdm = {
         #     enable = true;
	 #     greeters.slick.enable = true;
	 #     background = ../theming/wall.jpg;
	 #   };
	 # };

          windowManager.bspwm = {
            enable = true;
          };

	  #displayManager.sessionCommands = ''${pkgs.bspwm}/bin/bspc wm -r'';
        };
      };

      programs.zsh.enable = true;
      programs.slock.enable = true;

      environment.systemPackages = with pkgs; [
        xclip
	xorg.xev
	xorg.xkill
	xorg.xrandr
	arandr
	feh
      maim
      xdotool
      ];

      home-manager.users.${vars.user} = {
        xsession = {
          enable = true;
          windowManager = {
            bspwm = {
              enable = true;
              extraConfig = extraConf;
            };
          };
        };
      };
    };
}
