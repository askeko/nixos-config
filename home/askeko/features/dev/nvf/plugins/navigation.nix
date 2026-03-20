{
  programs.nvf.settings.vim = {
    navigation.harpoon = {
      enable = true;
      mappings = {
        file1 = "<C-H>";
        file2 = "<C-J>";
        file3 = "<C-K>";
        file4 = "<C-L>";
      };
    };
    luaConfigRC.harpoon-telescope = ''
      require('telescope').load_extension('harpoon')
    '';
  };
}
