{
  imports = [
    ./global

    ./features/desktop/hyprland
    ./features/uni
    ./features/dev
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "desc:Lenovo Group Limited 0x88A3,preferred,0x0,1"
      "desc:Lenovo Group Limited P27q-20,preferred,1920x0,1"
      "desc:Samsung Electric Company SAMSUNG 0x01000E00,preferred,auto,1,mirror,eDP-1"
      "desc:Lightware Visual Engineering,preferred,auto,1,mirror,eDP-1"
      "desc:Synaptics Inc Non-PnP 0x00BC614E,3440x1440,4480x0,1"
      "desc:Samsung Electric Company SAMSUNG 0x01000E00,preferred,auto,1,mirror,eDP-1"
      "desc:Lightware Visual Engineering,preferred,auto,1,mirror,eDP-1"
      "desc:Dell Inc. DELL,3440x1440,auto,1"
    ];
  };
}
