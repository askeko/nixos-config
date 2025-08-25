{...}: {
  imports = [
    ./assistant.nix
    ./bufferline.nix
    ./git.nix
    ./navigation.nix
  ];

  programs.nvf.settings.vim = {
    autocomplete.nvim-cmp.enable = true;
    autopairs.nvim-autopairs.enable = true;
    binds.cheatsheet.enable = true;
    binds.whichKey.enable = true;
    comments.comment-nvim.enable = true;
    filetree.neo-tree.enable = true;
    lsp.trouble.enable = true;
    snippets.luasnip.enable = true;
    statusline.lualine.enable = true;
    telescope.enable = true;
    ui.illuminate.enable = true;
    # utility.images.image-nvim.enable = true;
    utility.motion.flash-nvim.enable = true; # Compare with leap, etc.
    utility.oil-nvim.enable = true;
    utility.preview.markdownPreview.enable = true;
    utility.sleuth.enable = true;
    utility.surround.enable = true;
    visuals.rainbow-delimiters.enable = true;
  };
}
