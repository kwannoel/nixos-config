{ config, pkgs, ... }:

{
  # access the service via 127.0.0.1:8384
  # To check if service is up use systemctl | grep syncthing
  # Disable because not in use.
  services = {
      syncthing = {
          enable = false;
          user = "noel";
          dataDir = "/home/noel/Sync";
          configDir = "/home/noel/.config/syncthing";
          systemService = false;
      };
  };
}
