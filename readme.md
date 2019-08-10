# Set up

symlink device specific configuration:
> ln -s <device_folder>/<config_file> <config_file>

E.g.

> ln -s thinkpad/boot.nix boot.nix
> ln -s thinkpad/hardware-configuration.nix hardware-configuration.nix

Run init.sh to setup the nix system
