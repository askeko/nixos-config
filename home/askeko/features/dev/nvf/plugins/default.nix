{
  imports = [
    ./bufferline.nix
    ./git.nix
    ./harpoon.nix
    ./lualine.nix
    ./navigation.nix
    ./neotest.nix
    ./snacks.nix
    ./telescope.nix
    ./todo.nix
    ./which-key.nix
  ];

  programs.nvf.settings.vim = {
    autocomplete.nvim-cmp.enable = true;
    autopairs.nvim-autopairs.enable = true;
    comments.comment-nvim.enable = true;
    filetree.neo-tree.enable = true;
    lsp.trouble.enable = true;
    ui.illuminate.enable = true;
    utility.motion.flash-nvim.enable = true; # Compare with leap, etc.
    utility.oil-nvim.enable = true;
    utility.preview.markdownPreview.enable = true;
    utility.sleuth.enable = true;
    utility.surround.enable = true;
    visuals.rainbow-delimiters.enable = true;

    # Plugin keybinds
    maps = {
      normal = {
        # neo-tree
        "<leader>e" = {
          action = ":Neotree toggle<cr>";
          desc = "Toggle Neotree";
        };
      };
    };
  };
}
