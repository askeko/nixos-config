{
  programs = {
    ghostty = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        config-file = "/home/askeko/.config/theme/current/ghostty";
        font-size = 11;
        font-family = "FiraCode Nerd Font";
        font-style = "Regular";
        keybind = [
          "alt+h=goto_split:left"
          "alt+l=goto_split:right"
          "alt+k=goto_split:up"
          "alt+j=goto_split:down"
          "alt+enter=toggle_split_zoom"
          "ctrl+alt+v=new_split:right"
          "ctrl+alt+h=new_split:down"
          "alt+arrow_down=resize_split:down,100"
          "alt+arrow_left=resize_split:left,100"
          "alt+arrow_right=resize_split:right,100"
          "alt+arrow_up=resize_split:up,100"
          "alt+t=new_tab"
          "alt+q=close_tab:this"
          "alt+tab=next_tab"
          "alt+shift+tab=previous_tab"
          "alt+shift+arrow_left=previous_tab"
          "alt+shift+arrow_right=next_tab"
          "alt+d=close_surface"
        ];
        background-opacity = 0.7;
        font-feature = [
          "+calt"
          "+liga"
          "+dlig"
        ];
        window-padding-x = 10;
        window-padding-y = 10;
      };
    };
  };
}
