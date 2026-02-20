{ lib, ... }:
{
  programs.nvf.settings.vim = {
    augroups = [ { name = "highlight_yank"; } ];
    autocmds = [
      {
        event = [ "TextYankPost" ];
        group = "highlight_yank";
        desc = "Highlight on yank";
        callback = lib.generators.mkLuaInline ''
          function()
            (vim.hl or vim.highlight).on_yank()
          end
        '';
      }
    ];
  };
}
