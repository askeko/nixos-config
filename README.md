# nixos-config
## Installation (Graphical installer)
Boot into the graphical installer and follow the instructions, then reboot and login to the the user that was created

You might need to run `nixos-generate-config` to setup the hardware configuration, then copy the file into the appropriate hosts folder.

```
nix-env -iA nixos.git
git clone https://github.com/askeko/nixos-config/
nix-env -e git # To avoid package conflicts when building the system
nixos-rebuild switch --flake .#<hostname>
```

Logout and log back in.

### Special thanks
NixOS structure provided by @Misterio77
