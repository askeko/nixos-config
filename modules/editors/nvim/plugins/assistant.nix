{...}: {
  programs.nvf.settings.vim.assistant.copilot = {
    enable = true;
    cmp.enable = false;
    mappings.suggestion = {
      accept = "<C-CR>";
      dismiss = "<C-e>";
    };
    setupOpts = {
      panel = {
        enabled = false;
        layout.position = "right";
      };
      suggestion = {
        auto_trigger = true;
        debounce = 75;
      };
    };
  };
}
