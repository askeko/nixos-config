{
  wayland.windowManager.hyprland.settings = {
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

    monitor = [
      "desc:Lenovo Group Limited 0x88A3,preferred,0x0,1"
      "desc:Lenovo Group Limited P27q-20 V909LPXV,preferred,1920x0,1"
      "desc:Samsung Electric Company Odyssey G85SB H1AK500000,preferred,4480x0,1"
      "desc:Synaptics Inc Non-PnP 0x00BC614E,3440x1440,4480x0,1"
      "desc:Acer Technologies XB271HU T4TEE0028502,preferred,1920x0,1"
    ];

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
      gaps_out = [2 8 8 8];
      border_size = 3;

      layout = "master";
    };

    decoration = {
      rounding = 5;
      blur = {enabled = true;};
      shadow = {enabled = true;};
    };

    animations = {
      enabled = true;

      bezier = [
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "liner, 1, 1, 1, 1"
      ];

      animation = [
        "windows, 1, 6, wind, slide"
        "windowsIn, 1, 6, winIn, slide"
        "windowsOut, 1, 5, winOut, slide"
        "windowsMove, 1, 5, wind, slide"
        "fade, 1, 10, default"
        "workspaces, 1, 5, wind"
      ];
    };

    misc = {
      disable_hyprland_logo = true;
    };
  };
}
