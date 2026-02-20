{ pkgs, ... }:
{
  programs.nvf.settings.vim = {
    # Telescope
    telescope = {
      enable = true;
      mappings = {
        findFiles = "<leader>ff";
        liveGrep = "<leader>fg";
        buffers = "<leader>fb";
        resume = "<leader>fr";
      };
    };

    # Telescope extensions
    extraPlugins = with pkgs.vimPlugins; {
      telescope-fzf-native-nvim = {
        package = telescope-fzf-native-nvim;
        setup = ''
          require('telescope').load_extension('fzf')
        '';
      };
      telescope-file-browser-nvim = {
        package = telescope-file-browser-nvim;
        setup = ''
          require('telescope').load_extension('file_browser')
        '';
      };
    };

    # Telescope configuration for layout
    luaConfigRC.telescope-config = ''
      require('telescope').setup({
        defaults = {
          layout_strategy = "horizontal",
          sorting_strategy = "ascending",
        },
      })
    '';

    # Telescope keymaps
    maps.normal = {
      "<leader>fe" = {
        action = "<cmd>Telescope file_browser<cr>";
        desc = "File browser";
      };
    };
  };
}
