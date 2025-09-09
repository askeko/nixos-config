{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      extensions = {
        fzf-native.enable = true;
        file-browser.enable = true;
      };

      settings = {
        defaults = {
          layout_strategy = "horizontal";
          sorting_strategy = "ascending";
        };
      };
    };

    keymaps = [
      {
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
        options.desc = "Find files";
      }
      {
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<cr>";
        options.desc = "Live grep";
      }
      {
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<cr>";
        options.desc = "Find buffers";
      }
      {
        key = "<leader>fr";
        action = "<cmd>Telescope resume<cr>";
        options.desc = "Resume last search";
      }
      {
        key = "<leader>fe";
        action = "<cmd>Telescope file_browser<cr>";
        options.desc = "File browser";
      }
    ];
  };
}
