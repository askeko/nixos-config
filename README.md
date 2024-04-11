# nixos-config
## Installation
Partition, format, and mount drives (see NixOS installation guide, or use graphical install)
```
sudo su
nix-env -iA nixos.git
git clone https://github.com/askeko/nixos-config/ /mnt/etc/nixos
cd /mnt/etc/nixos
nixos-install --flake .#<hostname>
reboot
```
