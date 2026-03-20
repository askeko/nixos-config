# Askeko's NixOS Configuration

Multi-host NixOS flake config using the Misterio77 structure pattern.

## Tech Stack

- **NixOS** on `nixos-unstable`, **home-manager** as NixOS module, **Hyprland** (Wayland)
- **Neovim** via nvf, **formatter**: alejandra (`nix fmt`)
- **Host naming theme**: Porcupine Tree song names

## Workflow Preference

Do NOT write directly to files. Instead, show proposed changes as code blocks with the file path as a header. 
Let me review and implement changes myself. Only write to files when I explicitly ask you to.

## Structure

```
home/askeko/
  global/                           # ALL home configs import this (cli features, base settings)
  features/                         # Opt-in feature sets: cli/, desktop/, dev/, uni/
  <hostname>.nix                    # Per-host home config — picks which features to enable
hosts/
  common/
    global/                         # ALL hosts import this (nix settings, HM wiring, vars)
    optional/                       # Opt-in NixOS modules — hosts pick what they need
    users/askeko/                   # User account + auto-imports home/askeko/<hostname>.nix
  <hostname>/                       # Per-host: default.nix + hardware-configuration.nix
modules/
  home-manager/                     # Reusable nixos modules you might want to export, these are usually stuff you would upstream into nixpkgs
  nixos/                            # Reusable home-manager modules you might want to export, these are usually stuff you would upstream into home-manager
overlays/                           # Custom packages and modifications, exported as overlays
pkgs/                               # Custom packages, accessible through 'nix build', 'nix shell', etc
flake.nix                           # nixosConfigurations + homeConfigurations
```

## Critical Wiring

- `hosts/common/users/askeko/default.nix` auto-imports `home/askeko/${config.networking.hostName}.nix`
- `hosts/common/global/default.nix` passes `vars` (terminal, browser) to HM via `extraSpecialArgs`
- Optional modules are plain config attrsets — no `mkEnableOption` boilerplate
- Feature directories use `default.nix` as entry point that imports siblings

## Adding a New Host — Checklist

1. `hosts/<name>/default.nix` — import `common/global`, `common/users/askeko`, desired `common/optional/*`
2. `hosts/<name>/hardware-configuration.nix` — from `nixos-generate-config`
3. `home/askeko/<name>.nix` — import `./global` + desired `features/*`
4. Add `nixosConfigurations.<name>` in `flake.nix`

## Style

- `{ pkgs, ... }:` destructuring — only what's needed
- Flat optional modules, no options boilerplate
- Comments: `#` with a space
- Locale: `Europe/Copenhagen`, `en_DK.UTF-8`, keyboard `dk` or `eu` depending on host

## Commands

```bash
sudo nixos-rebuild switch --flake .#<hostname>
home-manager switch --flake .#askeko@absentia   # standalone HM
nix fmt
nix flake update
```
