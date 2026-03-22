{
  wayland.windowManager.hyprland = {
    extraConfig = ''
      source = ~/.config/theme/current/hyprland.conf
    '';

    settings = {
      # Settings for input devices
      input = {
        # Focus window at mouse
        follow_mouse = 1;

        # Touchpad scroll direction
        touchpad = {
          natural_scroll = "true";
        };

        # Set mouse acceleration (adaptive/flat/custom)
        accel_profile = "flat";
        # Set mouse sensitivity
        sensitivity = 0.2; # -1.0 - 1.0, 0 means no modification
      };

      cursor = {
        inactive_timeout = 2;
      };

      # Per-device options. Will override options set in input section.
      device = [
        # Integrated keyboard
        {
          name = "at-translated-set-2-keyboard";
          kb_layout = "dk";
          kb_variant = "";
          kb_model = "pc105";
          kb_options = "caps:swapescape";
          kb_rules = "";
          resolve_binds_by_sym = 1;
        }
        # External bluetooth keyboard
        {
          name = "logitech-k540/k545";
          kb_layout = "dk";
          kb_variant = "";
          kb_model = "pc105";
          kb_options = "caps:swapescape";
          kb_rules = "";
          resolve_binds_by_sym = 1;
        }
        # Yubikey
        {
          name = "yubico-yubikey-otp+fido+ccid";
          kb_layout = "dk";
          kb_variant = "";
          kb_model = "pc105";
          kb_options = "";
          kb_rules = "";
          resolve_binds_by_sym = 1;
        }
        # Glove80
        {
          name = "moergo-glove80-left-keyboard";
          kb_layout = "eu";
          kb_variant = "";
          kb_model = "pc105";
          kb_options = "";
          kb_rules = "";
          resolve_binds_by_sym = 1;
        }
      ];

      general = {
        gaps_in = 5;
        gaps_out = "8,8,8,8";
        border_size = 3;
        layout = "master";
      };

      decoration = {
        rounding = 5;
        blur = {
          enabled = true;
          size = 10;
        };
        shadow = {
          enabled = true;
        };
      };

      animations = {
        enabled = true;

        # Default curves, see https://wiki.hypr.land/Configuring/Animations/#curves
        bezier = [
          # NAME,          X0,   Y0,   X1,   Y1
          "easeOutQuint,   0.23, 1,    0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear,         0,    0,    1,    1"
          "almostLinear,   0.5,  0.5,  0.75, 1"
          "quick,          0.15, 0,    0.1,  1"
        ];

        # Default animations, see https://wiki.hypr.land/Configuring/Animations/
        animation = [
          # NAME,         ONOFF, SPEED, CURVE,        [STYLE]
          "global,        1,     10,    default"
          "border,        1,     5.39,  easeOutQuint"
          "windows,       1,     4.79,  easeOutQuint"
          "windowsIn,     1,     4.1,   easeOutQuint, popin 87%"
          "windowsOut,    1,     1.49,  linear,       popin 87%"
          "fadeIn,        1,     1.73,  almostLinear"
          "fadeOut,       1,     1.46,  almostLinear"
          "fade,          1,     3.03,  quick"
          "layers,        1,     3.81,  easeOutQuint"
          "layersIn,      1,     4,     easeOutQuint, fade"
          "layersOut,     1,     1.5,   linear,       fade"
          "fadeLayersIn,  1,     1.79,  almostLinear"
          "fadeLayersOut, 1,     1.39,  almostLinear"
          "workspaces,    1,     1.94,  almostLinear, fade"
          "workspacesIn,  1,     1.21,  almostLinear, fade"
          "workspacesOut, 1,     1.94,  almostLinear, fade"
          "zoomFactor,    1,     7,     quick"
        ];
      };

      dwindle = {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # you probably want this
      };

      master = {
        # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        new_on_top = true;
        mfact = 0.55;
      };

      misc = {
        disable_hyprland_logo = true;
        vfr = true;
      };
    };
  };
}
