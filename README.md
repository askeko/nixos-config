# nixos-config
## Installation

Partition, format, and mount drives (see NixOS installation guide), then run the following commands to install nixos:

```
sudo su
nix-env -iA nixos.git
git clone https://github.com/askeko/nixos-config/ /mnt/etc/nixos
cd /mnt/etc/nixos
nixos-install --flake .#<hostname>
```

[!NOTE]
Remember to set password for the user, otherwise log int as root and set it afterwards.

Reboot after installing nixos.

### Special thanks
NixOS structure provided by @Misterio77
