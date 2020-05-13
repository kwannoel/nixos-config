# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./user-shell.nix
      ./hardware-configuration.nix
      ./window-manager.nix
      # ./desktop-manager.nix
      ./sound.nix
      ./users.nix
      ./psql.nix
      ./fonts.nix
      ./emacs.nix
      ./boot.nix
      ./custom.nix
    ];

  # Allow firefox and other unfree pkgs
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable bluetooth
  hardware.bluetooth.enable = true;

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
    alias rebuild='source ~/nixos-config/init.sh'
    alias gcm='git commit --amend'
    alias gs='git status'
  '';

  environment.systemPackages = with pkgs; [
    # glava # audio visualization tool
    ag
    arandr # screen configuration
    awscli # aws cli
    bc # GNU calculator
    blueman # bluetooth
    cabal-install
    checkstyle # java code formatter
    chromium
    cargo-watch # watch cargo project src
    conda # python
    crawlTiles # DCSS
    dmenu
    docker
    docker-compose
    dwarf-fortress
    evtest # for testing keyboard inputs
    firefox
    fzf
    gcc
    ghostscript
    gimp # Image manipulation lib
    git
    graphviz # creating diagrams
    gparted
    gnumake # make
    haskellPackages.hakyll # hakyll static site generator
    haskellPackages.stack
    haskellPackages.servius # file server
    haskellPackages.xmobar # Top level install allows bin access, have to reconfig if want access within xmonad
    hugo
    imagemagick7
    jdk11
    jetbrains.idea-community # export _JAVA_AWT_WM_NONREPARENTING=1 # use this to workaround for wm
    killall # process handling
    libreoffice
    light # brightness handling
    libsForQt5.vlc # vlc media player
    mitscheme
    ngrok
    nmap # Check for open ports
    nodejs-12_x
    okular # edit pdfs
    inotify-tools # file watch hooks
    nomacs # Image Viewer
    postgresql_10
    qpdf
    qpdfview
    racket # lisp family
    rls # provides rust lang server for IDEs
    rustfmt # rust linting for emacs
    rustup # rust tool manager
    scrot # screenshot
    spotify
    sshguard # protects against ssh sniffing
    tdesktop # telegram
    tree
    unetbootin
    unzip
    vim
    wget
    xorg.xev
    xclip
    xorg.xkbcomp # editing keyboard configurations
    xorg.xmodmap
    yarn
    zoom
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Power client dbus
  services.upower.enable = true;

  # enable docker daemon
  virtualisation.docker.enable = true;

  # enable changing screen brightness
  programs.light.enable = true;

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
