{inputs, ...}: {
  imports = [
    inputs.nvf.homeManagerModules.default
    ./keymaps.nix
    ./lsp.nix
    ./plugins
  ];

  programs.nvf = {
    enable = true;
    enableManpages = true;
    settings.vim = {
      options = {
        tabstop = 4;
        softtabstop = 4;
        shiftwidth = 4;
        expandtab = true;
        wrap = false;
      };
      searchCase = "smart";
      theme = {
        enable = true;
        name = "everforest";
        style = "hard";
      };
      clipboard.registers = "unnamedplus";
    };
  };
}
