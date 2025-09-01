''
  @keyframes blink {
    to {
      background-color: @red;
    }
  }

  * {
    font-family:
      Symbols Nerd Font,
      FiraCode Nerd Font Mono;
    font-size: 15px;
    min-height: 0;
    margin-top: 1px;
  }

  #temperature,
  #cpu,
  #memory,
  #disk,
  #network,
  #custom-pacman,
  #custom-music,
  #tray,
  #backlight,
  #clock,
  #battery,
  #wireplumber,
  #custom-scrot {
    background-color: @background;
    padding: 0.5rem 0.8rem;
    margin: 8px 0;
  }

  #waybar {
    background: transparent;
    color: @background;
  }

  #workspaces {
    background-color: @background;
    border-radius: 2rem;
    margin: 8px;
    margin-left: 1rem;
  }

  #workspaces button {
    color: @magenta;
    border-radius: 1rem;
    padding: 0.4rem;
  }

  #workspaces button.empty {
    color: @foreground;
    border-radius: 1rem;
  }

  #workspaces button.active {
    color: @blue;
    border-radius: 1rem;
  }

  #workspaces button:hover {
    color: @magenta_alt;
    border-radius: 1rem;
  }

  #workspaces button.urgent {
    color: @magenta;
    border-radius: 1rem;
    animation-name: blink;
    animation-duration: 1s;
    animation-timing-function: steps(200);
    animation-iteration-count: infinite;
    animation-direction: alternate;
  }

  #temperature {
    color: @yellow;
    border-radius: 1rem 0px 0px 1rem;
    margin-left: 1rem;
  }

  #temperature.critical {
    animation-name: blink;
    animation-duration: 1s;
    animation-timing-function: steps(200);
    animation-iteration-count: infinite;
    animation-direction: alternate;
  }

  #cpu {
    color: @magenta;
  }

  #memory {
    color: @cyan;
  }

  #disk {
    color: @blue;
    border-radius: 0px 1rem 1rem 0px;
    margin-right: 1rem;
  }

  #network {
    color: @magenta;
  }

  #custom-pacman {
    color: @orange;
    border-radius: 1rem 0px 0px 1rem;
    margin-left: 1rem;
  }

  #clock {
    color: @blue;
    border-radius: 0px 1rem 1rem 0px;
    margin-right: 1rem;
  }

  #battery {
    color: @cyan;
  }

  #battery.critical:not(.charging) {
    animation-name: blink;
    animation-duration: 1s;
    animation-timing-function: steps(200);
    animation-iteration-count: infinite;
    animation-direction: alternate;
  }

  #backlight {
    color: @yellow;
  }

  #wireplumber {
    color: @green;
  }

  #wireplumber.muted {
    color: @background;
    background-color: @red;
  }

  #custom-music {
    color: @cyan_alt;
    border-radius: 1rem;
  }

  #custom-scrot {
    margin-right: 1rem;
    border-radius: 1rem;
    color: @green;
  }

  #tray {
    margin-right: 1rem;
    border-radius: 1rem;
  }
''
