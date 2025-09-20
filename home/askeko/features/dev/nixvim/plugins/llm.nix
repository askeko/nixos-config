{
  programs.nixvim = {
    plugins = {
      copilot-lua = {
        enable = true;
        settings = {
          panel.enabled = false;
          suggestion = {
            auto_trigger = true;
            keymap = {
              accept = "<C-CR>";
            };
          };
        };
      };
      avante = {
        enable = true;
        settings = {
          provider = "copilot";
          # provider = "ollama";
          providers.ollama = {
            endpoint = "http://localhost:11434";
            model = "qwen2.5-coder:latest";
          };
        };
      };
    };
  };
}
