{ pkgs, ... }:
{
  programs.nvf.settings.vim = {
    extraPlugins = with pkgs.vimPlugins; {
      snacks-nvim = {
        package = snacks-nvim;
        setup = ''
          require('snacks').setup({
            indent = { enabled = true },
            input = { enabled = true },
            -- TODO: Setup notifications
            notifier = { enabled = true },
            scope = { enabled = true },
            -- TODO: Setup gitsigns
            statuscolumn = { enabled = true },
            toggle = { enabled = true },
            words = { enabled = true },
          })
        '';
      };
    };

    # Snacks keybinding
    luaConfigRC.snacks-keymap = ''
      vim.keymap.set('n', '<leader>bd', function() require('snacks').bufdelete() end, { desc = 'Delete buffer' })
    '';
  };
}
