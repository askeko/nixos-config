{pkgs, ...}: {
  programs.nvf.settings.vim.extraPlugins.nvim-highlight-colors = {
    package = pkgs.vimPlugins.nvim-highlight-colors;
    setup = ''
      require("nvim-highlight-colors").setup({
        render = "background",
        enable_named_colors = false,
        enable_tailwind = true,
      })
    '';
  };
}
