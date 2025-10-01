{ pkgs, ... }:
{
  programs.nvf.config.vim.lazy.plugins = {
    "quicker.nvim" = {
      package = pkgs.vimPlugins.quicker;
    };
  };
}
