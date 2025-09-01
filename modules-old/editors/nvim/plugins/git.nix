{...}: {
  programs.nvf.settings.vim = {
    git = {
      enable = true;
      gitsigns = {
        enable = true;
        setupOpts = {
          current_line_blame = true;
        };
        mappings = {
          previewHunk = "ghd";
          nextHunk = "ghn";
          previousHunk = "ghN";
          resetHunk = "ghr";
          stageHunk = "ghs";
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
