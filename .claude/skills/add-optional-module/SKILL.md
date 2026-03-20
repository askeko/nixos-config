---
name: add-optional-module
description: Create a new optional NixOS module in hosts/common/optional/. Use when the user wants to add a new system-level service, hardware config, or capability — e.g. "add docker support", "enable printing", "add nvidia", "create a wireguard module".
---

# Add Optional NixOS Module

Creates a new optional module in `hosts/common/optional/`.

## Pattern

Optional modules in this config are **plain NixOS config attrsets** — no `mkEnableOption` or options boilerplate. They are simple, self-contained, and imported explicitly by whichever host needs them.

## Gather Information

1. **What capability** does the module add? (e.g. Docker, printing, NVIDIA, VPN)
2. **Which hosts** should use it?

## Create the Module

Create `hosts/common/optional/<name>.nix`:

```nix
{ pkgs, ... }:
{
  # Description of what this module enables
  <NixOS options here>
}
```

Only include `pkgs` or other args in the function signature if actually used. If the module is pure config with no package references, use just:

```nix
{
  <NixOS options here>
}
```

### Existing examples for reference

**Simple service** (`docker.nix`):
```nix
{
  virtualisation.docker.enable = true;
}
```

**Hardware with service** (`bluetooth.nix`):
```nix
{
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
```

**Complex module** (`nvidia.nix`):
```nix
{ config, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
```

## After Creating

1. Tell the user to import it in whichever host config needs it by adding `../common/optional/<name>.nix` to the imports list in `hosts/<hostname>/default.nix`
2. If the module adds new groups (e.g. `docker`), check if `hosts/common/users/askeko/default.nix` should include that group in the `ifTheyExist` list
3. Run `nix fmt **/*.nix` to format the new file
