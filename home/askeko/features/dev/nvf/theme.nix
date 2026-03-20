{pkgs, ...}: {
  programs.nvf.settings.vim = {
    extraPlugins = {
      # Flexoki theme - custom plugin since it's not in nvf built-ins
      # Using kepano/flexoki-neovim - the original implementation
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
        setup = ''
          -- Set background
          vim.o.background = "dark" -- "dark" or "light"

          -- Load Flexoki colorscheme
          vim.cmd.colorscheme("flexoki-dark")  -- "flexoki-dark" or "flexoki-light"
        '';
      };
    };
    luaConfigRC.transparency = ''
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    '';
  };
}
