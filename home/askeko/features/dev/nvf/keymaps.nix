{
  programs.nvf.settings.vim = {
    maps = {
      normal = {
        # Window navigation
        "<C-h>" = {
          action = "<C-w>h";
          desc = "Navigate to left window";
        };
        "<C-j>" = {
          action = "<C-w>j";
          desc = "Navigate to bottom window";
        };
        "<C-k>" = {
          action = "<C-w>k";
          desc = "Navigate to top window";
        };
        "<C-l>" = {
          action = "<C-w>l";
          desc = "Navigate to right window";
        };
        "<C-Left>" = {
          action = "<C-w>h";
          desc = "Navigate to left window";
        };
        "<C-Down>" = {
          action = "<C-w>j";
          desc = "Navigate to bottom window";
        };
        "<C-Up>" = {
          action = "<C-w>k";
          desc = "Navigate to top window";
        };
        "<C-Right>" = {
          action = "<C-w>l";
          desc = "Navigate to right window";
        };

        # Centered scrolling - ZZ Jumps
        "<C-d>" = {
          action = "<C-d>zz";
          desc = "Scroll down and center";
        };
        "<C-u>" = {
          action = "<C-u>zz";
          desc = "Scroll up and center";
        };
        "n" = {
          action = "nzzzv";
          desc = "Next search result centered";
        };
        "N" = {
          action = "Nzzzv";
          desc = "Previous search result centered";
        };
        "gd" = {
          action = "gdzzzv";
          desc = "Go to definition centered";
        };
        "<leader>qq" = {
          action = "<cmd>qa<cr>";
          desc = "Quit all";
        };
      };
    };
  };
}
