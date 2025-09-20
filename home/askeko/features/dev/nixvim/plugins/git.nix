{
  programs.nixvim = {
    plugins.gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
        current_line_blame_opts = {
          delay = 1000;
        };
      };
    };
    keymaps = [
      {
        key = "gtw";
        mode = "n";
        action = ":Gitsigns toggle_word_diff<CR>";
      }
    ];
  };
}
