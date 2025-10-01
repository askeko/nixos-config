{
  programs = {
    starship = {
      enable = true;
      enableZshIntegration = true;
    };
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;
      history.size = 100000;

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
      };

      initContent = ''
        autoload -U promptinit; promptinit
        # Hook direnv
        eval "$(direnv hook zsh)"
        # Starship prompt
        eval "$(starship init zsh)"
      '';
    };
  };
}
