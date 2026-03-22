{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    extraConfig = "include /home/askeko/.config/theme/current/kitty.conf";
    settings = {
      window_padding_width = 5;
      font_family = "FiraCode Nerd Font Mono";
      bold_font = "FiraCode Nerd Font Mono Bold";
      font_size = 11.0;
      enable_audio_bell = "no";

      background_opacity = 0.7;
    };
  };
}
