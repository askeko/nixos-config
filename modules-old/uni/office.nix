{
  pkgs,
  vars,
  ...
}: {
  home-manager.users.${vars.user} = {
    home.packages = with pkgs; [
      libreoffice # Needed for exams that for some reason needs to be signed with an office program...
    ];
  };
}
