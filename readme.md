# NixOS Configuration

## Install nixos image + flash to usb

Reference: https://nixos.org/manual/nixos/stable/#sec-booting-from-usb.

1. Find the device name of the usb drive
```bash
diskutil list
```

2. Unmount the usb drive
```bash
diskutil unmountDisk disk<X>
```

3. Flash the image to the usb drive
```bash
sudo dd if=<path-to-image> of=/dev/rdiskX bs=4m
```

## Set up

symlink device specific configuration:
> ln -s <device_folder>/<config_file> <config_file>

E.g.

> ln -s thinkpad/boot.nix boot.nix
> ln -s thinkpad/hardware-configuration.nix hardware-configuration.nix

Run init.sh to setup the nix system

## Upgrades

TODO: how to upgrade hardware config
