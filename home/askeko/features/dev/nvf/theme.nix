{pkgs, ...}: {
  programs.nvf.settings.vim = {
    extraPlugins = {
      flexoki-neovim = {
        package = pkgs.vimUtils.buildVimPlugin {
          pname = "flexoki-neovim";
          version = "2024-01-15";
          src = pkgs.fetchFromGitHub {
            owner = "kepano";
            repo = "flexoki-neovim";
            rev = "main";
            sha256 = "sha256-TlBP99MBAT/H0Uut1MF8SnIDoeetcdHLKrWal2oO2Ug=";
          };
        };
      };
      everforest-nvim = {
        package = pkgs.vimUtils.buildVimPlugin {
          pname = "everforest-nvim";
          version = "2024-12-01";
          src = pkgs.fetchFromGitHub {
            owner = "neanias";
            repo = "everforest-nvim";
            rev = "main";
            sha256 = "sha256-PXZpEl2CIlgmXqqFMh1nSwxGOtiM0jmKYDBF2DoVCpc=";
          };
        };
      };
    };

    luaConfigRC.theme-00-server = ''
      vim.fn.serverstart("/tmp/nvim-" .. vim.fn.getpid() .. ".sock")
    '';

    # Load theme from runtime file on startup (sorts before 'transparency')
    luaConfigRC.aaa-theme-load = ''
      local theme_file = vim.fn.expand("~/.config/theme/current/nvim.lua")
      if vim.fn.filereadable(theme_file) == 1 then
        dofile(theme_file)
      else
        vim.o.background = "dark"
        vim.cmd.colorscheme("everforest")
      end
    '';

    # Transparency overrides (applied after theme load)
    luaConfigRC.theme-02-transparency = ''
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    '';
  };
}
