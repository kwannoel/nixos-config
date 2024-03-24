{ config, pkgs, ... }:

{
  # Use the GRUB 2 boot loader.
  # boot.loader.grub.enable = true;
  # boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.grub.devices = [ "/dev/nvme0n1p1" ]; # or "nodev" for efi only
  boot.loader.systemd-boot.enable = true;
  # boot.supportedFilesystems = [ "ntfs" ];
}
