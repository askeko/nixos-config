# 
# bspwm configuration
# Enable with "bspwm.enable = true;"
#

{ config, lib, pkgs, vars, host, ... }:

with lib;
with host;
let 
  extra = ''
    ( sleep 3 && bspc monitor -d 1 2 3 4 5 6 7 8 9 0 )

    bspc config border_width 3
    bspc config split_ratio 0.5

    bspc config focus_follows_pointer false
    bspc config borderless_monocle false
    bspc config gapless_monocle false
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
          xkbVariant = "dvorak";
	  xkbOptions = "caps:escape";
	  libinput = {
            enable = true;
	  };

	  displayManager = {
            lightdm = {
              enable = true;
	    };
	    defaultSession = "none+bspwm";
	  };

          windowManager.bspwm = {
            enable = true;
          };

	  displayManager.sessionCommands = ''${vars.terminal}'';
        };
      };

      programs.zsh.enable = true;

      environment.systemPackages = with pkgs; [
        xclip
	xorg.xev
	xorg.xkill
	xorg.xrandr
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
