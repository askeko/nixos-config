{
  programs.nixvim = {
    plugins = {
      neotest = {
        enable = true;
        adapters = {
          vitest = {
            enable = true;
          };
        };
      };
    };
  };
}
