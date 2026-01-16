{
  programs.nixvim = {
    plugins.snacks = {
      enable = true;

      settings = {
        indent.enable = true;
        input.enable = true;
        # TODO: Setup notifications
        notifier.enable = true;
        scope.enable = true;
        # TODO: Setup gitsigns
        statuscolumn.enable = true;
        toggle.enable = true;
        words.enable = true;
      };
    };
    keymaps = [
      {
        key = "<leader>bd";
        mode = "n";
        action = "<cmd> lua Snacks.bufdelete()<CR>";
        options = {
          desc = "Delete buffer";
        };
      }
    ];
  };
}
