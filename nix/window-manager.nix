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
    # extraLayouts = {
    #   noel_kinesis = {
    #     description = "My custom layout.";
    #     languages = ["us"];
    #     symbolsFile = xkbLayout;
    #   };
    # };
    # layout = "noel_kinesis";
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
        haskellPackages.data-default
      ];
    };
    # displayManager.defaultSession = "none+xmonad";
    # desktopManager.xterm.enable = false;
  };

  # bigger tty fonts
  console.font =     "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
  services.xserver.dpi = 180;
  environment.variables = {
     GDK_SCALE = "2";
     GDK_DPI_SCALE = "0.5";
     _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  }; 

  # suspend and lock on lid close
  # powerManagement.enable = true;
  # powerManagement.resumeCommands = "${pkgs.kmod}/bin/rmmod atkbd; ${pkgs.kmod}/bin/modprobe atkbd reset=1";
  # powerManagement.powertop.enable = true;
  # services.physlock.enable = true;
  # services.physlock.lockOn.suspend = true;
}
