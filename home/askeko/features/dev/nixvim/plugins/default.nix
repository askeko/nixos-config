{
  imports = [
    ./telescope.nix
    ./llm.nix
    ./git.nix
    ./harpoon.nix
    ./neotest.nix
    ./notebook.nix
  ];

  programs.nixvim = {
    plugins = {
      neo-tree.enable = true;
      nvim-autopairs.enable = true;
      trouble.enable = true;
      illuminate.enable = true;
      sleuth.enable = true;
      nvim-surround.enable = true;
      rainbow-delimiters.enable = true;
      highlight-colors.enable = true;
      nvim-lightbulb.enable = true;
      render-markdown = {
        enable = true;
        settings = {
          file_types = [
            "markdown"
            "quarto"
          ];
          render_modes = [
            "n"
            "c"
            "t"
            "i"
            "v"
          ];
        };
      };
    };
  };
}
