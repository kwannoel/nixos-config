# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  xkbLayout = pkgs.writeText "xkb-layout" ''
    xkb_symbols "noel_kinesis" {
      include "pc+us+inet(evdev)+capslock(swapescape)+eurosign(e)"
    };
  '';
in
{
  services.xserver = {
    enable = true;
    extraLayouts = {
      noel_kinesis = {
        description = "My custom layout.";
        languages = ["us"];
        symbolsFile = xkbLayout;
      };
    };
    layout = "noel_kinesis";
    xkbOptions = "eurosign:e, caps:swapescape";
    # Enable touchpad support.
    libinput.enable = true;

    # Enable XMonad
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad-contrib
        haskellPackages.xmonad-extras
        haskellPackages.xmonad
      ];
    };
    displayManager.defaultSession = "none+xmonad";

    desktopManager.xterm.enable = false;
  };

  # suspend and lock on lid close
  powerManagement.enable = true;
  # powerManagement.powertop.enable = true;
  # services.upower.enable = true;
  services.physlock.enable = true;
  services.physlock.lockOn.suspend = true;
}
