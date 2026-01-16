{
  programs.git = {
    enable = true;
    settings = {
      user.name = "askeko";
      user.email = "askeklitgaard@gmail.com";
      alias = {
        graph = "log --decorate --oneline --graph";
      };
    };
  };
}
