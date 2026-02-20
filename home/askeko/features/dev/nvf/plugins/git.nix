{
  programs.nvf.settings.vim = {
    # Git integration
    git = {
      enable = true;
      gitsigns = {
        enable = true;
        codeActions.enable = false;
        mappings = {
          nextHunk = "]c";
          previousHunk = "[c";
          stageHunk = "<leader>hs";
          resetHunk = "<leader>hr";
          undoStageHunk = "<leader>hu";
          previewHunk = "<leader>hp";
          blameLine = "<leader>hb";
          diffThis = "<leader>hd";
          toggleBlame = "<leader>tb";
        };
      };
    };

    # Gitsigns configuration for current line blame
    luaConfigRC.gitsigns-config = ''
      require('gitsigns').setup({
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 1000,
        },
      })
    '';

    # Git keymaps
    maps.normal = {
      "gtw" = {
        action = ":Gitsigns toggle_word_diff<CR>";
        desc = "Toggle word diff";
      };
    };
  };
}
