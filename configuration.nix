# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./window-manager.nix
      # ./desktop-manager.nix
      ./sound.nix
      ./users.nix
      ./psql.nix
      ./fonts.nix
      ./emacs.nix
      ./boot.nix
    ];

  # Allow firefox and other unfree pkgs
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "Asia/Singapore";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  
  environment.interactiveShellInit = ''
    alias e='emacsclient -c -a ""'
  '';

  environment.systemPackages = with pkgs; [
    git
    firefox
    wget
    vim
    dmenu
    tdesktop # telegram
    xclip
    tree
    scrot # screenshot
    gimp # Image manipulation lib
    haskellPackages.xmobar # Top level install allows bin access, have to reconfig if want access within xmonad
    haskellPackages.stack
    nodejs-11_x
    qpdf
    postgresql_10
    libreoffice
    ghostscript
    unetbootin
    gparted
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Power client dbus
  # services.upower.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?

}
