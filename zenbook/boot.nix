{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # services.xserver.videoDrivers = ["nvidia"];
  # hardware.nvidia.package = ["nvidia_modeset"];
  # hardware.nvidia.modesetting.enable = true;
  # services.xserver.videoDrivers = ["nvidia"];
  # services.xserver.videoDrivers = ["modesetting"]; if the above throws any issues
  boot.blacklistedKernelModules = ["nouveau"];
  console.font = "latarcyrheb-sun32";
}
