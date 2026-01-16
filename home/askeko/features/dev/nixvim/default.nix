{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./plugins
    ./keymaps.nix
    ./lsp.nix
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.everforest = {
      enable = true;
    };

    globals = {
      mapleader = " ";
    };

    opts = {
      number = true;
      relativenumber = true;
      tabstop = 4;
      softtabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      wrap = false;
      ignorecase = true;
      smarttab = true;
      smartcase = true;
      foldmethod = "expr";
      foldexpr = "nvim_treesitter#foldexpr()";
      foldenable = false;
    };

    clipboard.register = "unnamedplus";
  };
}
