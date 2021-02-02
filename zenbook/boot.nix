{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  services.xserver.videoDrivers = ["nvidia_modeset"];
  # services.xserver.videoDrivers = ["nvidia"];
  # services.xserver.videoDrivers = ["modesetting"]; if the above throws any issues
  boot.blacklistedKernelModules = ["nouveau"];
  console.font = "latarcyrheb-sun32";
}
