{ pkgs, ... }:
{
  programs = {
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
        # Spaceship
        source ${pkgs.spaceship-prompt}/share/zsh/site-functions/prompt_spaceship_setup
        autoload -U promptinit; promptinit
        # Hook direnv
        eval "$(direnv hook zsh)"
      '';
    };
  };
}
