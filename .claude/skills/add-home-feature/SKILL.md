---
name: add-home-feature
description: Create a new home-manager feature under home/askeko/features/. Use when adding user-level programs, tools, or configurations — e.g. "add gaming feature", "set up tmux", "add music player", "create a productivity feature".
---

# Add Home-Manager Feature

Creates a new feature directory or file under `home/askeko/features/`.

## Understand the Structure

Features are organized by category:
- `features/cli/` — shell and terminal tools
- `features/desktop/` — GUI apps and desktop environment config
- `features/dev/` — development tools and editors
- `features/uni/` — university/academic tools

Each category has a `default.nix` entry point that imports its sub-files.

## Gather Information

1. **What tool/program** to add?
2. **Which category** does it belong to? (existing category, or a new one?)
3. **Which hosts** should enable it?

## Decide: New File in Existing Category vs New Category

### Adding to an existing category

Create `home/askeko/features/<category>/<tool>.nix`:

```nix
{ pkgs, ... }:
{
  # Single program with home-manager module
  programs.<tool> = {
    enable = true;
    # config here
  };
}
```

Or for packages without a home-manager module:

```nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    <package>
  ];
}
```

Then add the import to the category's `default.nix`:

```nix
  imports = [
    ./<existing-files>.nix
    ./<tool>.nix            # Add this line
  ];
```

### Creating a new category

Create `home/askeko/features/<category>/default.nix`:

```nix
{ pkgs, ... }:
{
  imports = [
    ./<tool-a>.nix
    ./<tool-b>.nix
  ];

  # Any shared config or packages for this category
  home.packages = with pkgs; [
    # ...
  ];
}
```

Then create individual tool files alongside it.

### Existing examples for reference

**Simple program module** (`cli/bat.nix`):
```nix
{
  programs.bat = {
    enable = true;
    config = {
      theme = "gruvbox-dark";
    };
  };
}
```

**Category with multiple imports** (`uni/default.nix`):
```nix
{
  imports = [
    ./godot.nix
    ./office.nix
    ./quickemu.nix
    ./tapaal.nix
    ./uppaal.nix
  ];
}
```

**Feature using vars** (`desktop/hyprland/binds.nix`):
```nix
{ vars, ... }:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mainMod, RETURN, exec, ${vars.terminal}"
    ];
  };
}
```

## After Creating

1. If it's a **new category**, tell the user to import it from `home/askeko/<hostname>.nix` for each host that should have it
2. If it's a **new file in an existing category**, add the import to that category's `default.nix` — it will automatically apply to all hosts using that category
3. If the feature needs a **system-level counterpart** (e.g. a service, hardware config), suggest also creating an optional module with the add-optional-module skill
4. Run `nix fmt` to format new files
