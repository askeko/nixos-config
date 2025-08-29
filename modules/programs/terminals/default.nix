{vars, ...}: let
  terminals = {
    kitty = ./kitty.nix;
    wezterm = ./wezterm.nix;
  };

  # Depending on what the terminal var is set to in flake.nix, import that module only
  chosen =
    terminals.${vars.terminal} or (throw "Unsupported terminal '${vars.terminal}'. Choose one of: ${builtins.concatStringsSep ", " (builtins.attrNames terminals)}");
in {
  # Only the chosen terminal module is imported
  imports = [chosen];
}
