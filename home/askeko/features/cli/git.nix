{
  programs.git = {
    enable = true;
    settings = {
      user.name = "askeko";
      user.email = "askeklitgaard@gmail.com";
      alias = {
        graph = "log --decorate --oneline --graph";
        mt = "mergetool";
      };
      core.editor = "nvim";
      diff.colorMoved = "zebra";
      mergetool."diffview".cmd = ''nvim -n -c "DiffviewOpen" "$MERGED"'';
      merge.tool = "diffview";
    };
  };
}
