{ pkgs, ... }:
{
  programs.nvf.settings.vim = {
    extraPlugins = with pkgs.vimPlugins; {
      # Neotest
      neotest = {
        package = neotest;
        setup = ''
          require('neotest').setup({
            adapters = {
              require('neotest-vitest'),
            }
          })
        '';
      };
      neotest-vitest = {
        package = neotest-vitest;
      };
    };
  };
}
