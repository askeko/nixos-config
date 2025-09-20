{
  programs.nixvim = {
    plugins = {
      otter.enable = true;
      molten = {
        enable = true;
        settings = {
          auto_image_popup = true;
          auto_init_behavior = "init";
          auto_open_html_in_browser = true;
          auto_open_output = true;
          enter_output_behavior = "open_then_enter";
          image_provider = "none"; # "image.nvim"
          output_crop_border = false;
          output_virt_lines = true;
          output_win_hide_on_leave = true; # Maybe change?
          virt_text_max_lines = 20; # Default was 12
          virt_text_output = true;
        };
      };
      quarto = {
        enable = true;
        settings = {
          codeRunner = {
            enabled = true;
            default_method = "molten";
          };
          lspFeatures = {
            languages = [
              "python"
              "r"
              "julia"
              "bash"
              "html"
              "rust"
            ];
          };
        };
      };
    };
  };
}
