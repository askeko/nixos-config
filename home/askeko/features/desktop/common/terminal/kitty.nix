{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      window_padding_width = 5;
      font_family = "FiraCode Nerd Font Mono";
      bold_font = "FiraCode Nerd Font Mono Bold";
      font_size = 11.0;
      enable_audio_bell = "no";

      # Flexoki Dark Theme
      foreground = "#CECDC3";
      background = "#100F0F";
      selection_foreground = "#CECDC3";
      selection_background = "#403E3C";
      cursor = "#CECDC3";
      cursor_text_color = "#100F0F";
      url_color = "#4385BE";
      active_border_color = "#AF3029";
      inactive_border_color = "#403E3C";
      bell_border_color = "#D14D41";
      visual_bell_color = "none";
      wayland_titlebar_color = "system";
      macos_titlebar_color = "system";
      active_tab_background = "#403E3C";
      active_tab_foreground = "#CECDC3";
      inactive_tab_background = "#282726";
      inactive_tab_foreground = "#878580";
      tab_bar_background = "#100F0F";
      tab_bar_margin_color = "none";
      mark1_foreground = "#100F0F";
      mark1_background = "#4385BE";
      mark2_foreground = "#100F0F";
      mark2_background = "#CECDC3";
      mark3_foreground = "#100F0F";
      mark3_background = "#CE5D97";

      # black
      color0 = "#100F0F";
      color8 = "#6F6E69";
      # red
      color1 = "#AF3029";
      color9 = "#D14D41";
      # green
      color2 = "#66800B";
      color10 = "#879A39";
      # yellow
      color3 = "#AD8301";
      color11 = "#D0A215";
      # blue
      color4 = "#205EA6";
      color12 = "#4385BE";
      # magenta
      color5 = "#A02F6F";
      color13 = "#CE5D97";
      # cyan
      color6 = "#24837B";
      color14 = "#3AA99F";
      # white
      color7 = "#878580";
      color15 = "#CECDC3";
    };
  };
}
