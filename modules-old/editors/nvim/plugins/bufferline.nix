{...}: {
  programs.nvf.settings.vim.tabline.nvimBufferline = {
    enable = true;
    mappings = {
      closeCurrent = "<M-q>";
      cycleNext = "<M-l>";
      cyclePrevious = "<M-h>";
    };
  };
}
