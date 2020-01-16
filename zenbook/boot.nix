{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  services.xserver.videoDrivers = ["nvidia_modeset"];
  # services.xserver.videoDrivers = ["modesetting"]; if the above throws any issues
  boot.blacklistedKernelModules = ["nouveau"];
  i18n.consoleFont = "latarcyrheb-sun32";
}
