# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;

  # Only full build has bluetooth support
  hardware.pulseaudio.package = pkgs.pulseaudioFull;
}
