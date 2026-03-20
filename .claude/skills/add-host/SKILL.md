---
name: add-host
description: Scaffold a new NixOS host configuration. Use when adding a new machine, computer, or system to the config — e.g. "add a new host", "create a server config", "set up a new machine".
---

# Add a New NixOS Host

Scaffolds all files needed for a new host in this NixOS config.

## Gather Information

Before creating files, ask the user for:
1. **Hostname** (must be a Porcupine Tree song name — suggest options if they want)
2. **Machine type** (desktop, laptop, server, VM, etc.)
3. **CPU** (AMD or Intel — determines `kvm-amd` vs `kvm-intel` and microcode)
4. **GPU** (NVIDIA, AMD, Intel integrated, or none)
5. **Which optional modules** to enable (list what's in `hosts/common/optional/`)
6. **Which home features** to enable (list what's in `home/askeko/features/`)
7. **Any laptop-specific needs** (brightness control, touchpad, accelerometer, lid suspend)

## Files to Create

### 1. `hosts/<hostname>/default.nix`

Follow this pattern exactly:

```nix
#
#  Specific system configuration settings for <machine type>
#
{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/users/askeko

    # Add optional modules based on user's answers
    ../common/optional/hyprland.nix
    ../common/optional/pipewire.nix
    # ... etc
  ];

  networking = {
    hostName = "<hostname>";
    networkmanager.enable = true;
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # Locale settings
  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_DK.UTF-8";

  services.xserver = {
    xkb.layout = "dk";
    xkb.options = "caps:swapescape";
  };

  console.useXkbConfig = true;

  system.stateVersion = "<current NixOS stable version>";
}
```

For laptops, also consider adding: `hardware.acpilight.enable`, `hardware.sensor.iio.enable`, `boot.kernelPackages = pkgs.linuxPackages_latest`.

### 2. `hosts/<hostname>/hardware-configuration.nix`

Create a placeholder with `CHANGE-ME` UUIDs. Match the CPU type:
- AMD: `boot.kernelModules = [ "kvm-amd" ];` and `hardware.cpu.amd.updateMicrocode`
- Intel: `boot.kernelModules = [ "kvm-intel" ];` and `hardware.cpu.intel.updateMicrocode`

Tell the user they MUST replace this with the output of `nixos-generate-config` on the actual machine.

### 3. `home/askeko/<hostname>.nix`

```nix
{
  imports = [
    ./global

    # Add features based on user's answers
    ./features/desktop/hyprland
    ./features/dev
    # ... etc
  ];
}
```

### 4. Update `flake.nix`

Add to the `nixosConfigurations` attrset:

```nix
        # <Machine type> configuration
        <hostname> = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/<hostname>
          ];
        };
```

## After Creating

- Remind the user to replace `hardware-configuration.nix` with real output from `nixos-generate-config`
- Remind them to `git add` all new files before building
- Show the build command: `sudo nixos-rebuild switch --flake .#<hostname>`

## If Optional Modules Don't Exist Yet

If the user needs a module that doesn't exist in `hosts/common/optional/` yet, offer to create it using the add-optional-module skill.
