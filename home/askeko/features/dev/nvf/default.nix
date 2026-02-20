{ inputs, ... }:
{
  imports = [
    inputs.nvf.homeManagerModules.default
    ./theme.nix
    ./plugins
    ./keymaps.nix
    ./lsp.nix
    ./autocmds.nix
  ];

  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;

      # Leader key
      globals.mapleader = " ";

      # Editor options
      lineNumberMode = "relNumber";

      # Custom options
      options = {
        tabstop = 4; # Width of tab space
        softtabstop = 4; # Number of spaces inserted when pressing tab
        shiftwidth = 4; # Number of spaces for each indentation level
        expandtab = true; # Converts tabs to spaces
        smarttab = true; # Use shiftwidth at line start, tabstop elsewhere

        wrap = false; # Word wrapping

        ignorecase = true; # Case-insensitive search
        smartcase = true; # Override ignorecase if search has upper-case

        # TODO: How to fold?? (fold indents/functions/etc.)
        foldmethod = "expr";
        foldexpr = "nvim_treesitter#foldexpr()";
        foldenable = false;
      };

      clipboard = {
        enable = true;
        registers = "unnamedplus";
      };

      # Theme
      theme = {
        enable = false;
      };
    };
  };
}
