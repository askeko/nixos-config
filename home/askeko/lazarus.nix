{
  imports = [
    ./global

    ./features/desktop/hyprland
    ./features/uni
    ./features/dev
    ./features/vpn.nix
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "desc:Samsung Electric Company Odyssey G85SB H1AK500000,3440x1440@174.96Hz,0x0,1,bitdepth, 10, cm, hdr"
      "desc:Acer Technologies XB271HU,2560x1440@165.00Hz,-2560x0,1"
    ];

    workspace = [
      "1,monitor:desc:Samsung Electric Company Odyssey G85SB,default:true"
      "2,monitor:desc:Samsung Electric Company Odyssey G85SB,default:true"
      "3,monitor:desc:Samsung Electric Company Odyssey G85SB,default:true"
      "4,monitor:desc:Samsung Electric Company Odyssey G85SB,default:true"
      "5,monitor:desc:Samsung Electric Company Odyssey G85SB,default:true"
      "6,monitor:desc:Acer Technologies XB271HU,default:true"
      "7,monitor:desc:Acer Technologies XB271HU,default:true"
      "8,monitor:desc:Acer Technologies XB271HU,default:true"
      "9,monitor:desc:Acer Technologies XB271HU,default:true"
      "10,monitor:desc:Acer Technologies XB271HU,default:true"
    ];
  };
}
