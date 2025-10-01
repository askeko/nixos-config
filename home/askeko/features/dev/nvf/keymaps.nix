{
  programs.nvf.settings.vim = {
    keymaps = [
      ### Movement ###
      # Windows
      {
        key = "<C-h>";
        mode = "n";
        action = "<C-w>h";
      }
      {
        key = "<C-j>";
        mode = "n";
        action = "<C-w>j";
      }
      {
        key = "<C-k>";
        mode = "n";
        action = "<C-w>k";
      }
      {
        key = "<C-l>";
        mode = "n";
        action = "<C-w>l";
      }
      {
        key = "<C-Left>";
        mode = "n";
        action = "<C-w>h";
      }
      {
        key = "<C-Down>";
        mode = "n";
        action = "<C-w>j";
      }
      {
        key = "<C-Up>";
        mode = "n";
        action = "<C-w>k";
      }
      {
        key = "<C-Right>";
        mode = "n";
        action = "<c-w>l";
      }
      # ZZ Jumps
      {
        key = "<C-d>";
        mode = "n";
        action = "<C-d>zz";
      }
      {
        key = "<C-u>";
        mode = "n";
        action = "<C-u>zz";
      }
      {
        key = "n";
        mode = "n";
        action = "nzzzv";
      }
      {
        key = "N";
        mode = "n";
        action = "Nzzzv";
      }
      {
        key = "gd";
        mode = "n";
        action = "gdzzzv";
      }
      # Haskell
      {
        key = "<leader>hs";
        mode = "n";
        action = ":lua require('haskell-tools').hoogle.hoogle_signature()<CR>";
      }
      {
        key = "<leader>he";
        mode = "n";
        action = ":lua require('haskell-tools').lsp.buf_eval_all()<CR>";
      }
      {
        key = "<leader>hr";
        mode = "n";
        action = ":lua require('haskell-tools').repl.toggle()<CR>";
      }
    ];
  };
}
