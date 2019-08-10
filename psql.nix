# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  services.postgresql = {
    enable = true;
    initialScript = /home/noel/Helpers/setupDB.sql;
   };
}