# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports =
    [ ./user-shell.nix
      ./hardware-configuration.nix
      ./window-manager.nix
      ./fan.nix
      # ./desktop-manager.nix
      ./sound.nix
      ./users.nix
      # ./psql.nix
      # ./sync.nix # sync across machines
      ./fonts.nix
      ./emacs.nix
      ./boot.nix
      ./custom.nix
      ./cachix.nix
    ];

  # https://nixos.wiki/wiki/Storage_optimization
  # nix-store --optimize
  # nix-collect-garbage -d
  # sudo nix-collect-garbage
  # du -h --max-depth=1 . | rg "G"
  nix.autoOptimiseStore = true;

  # Allow firefox and other unfree pkgs
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # open gl support
  hardware.opengl.driSupport32Bit = true;

  # enable OpenGL support
  hardware.opengl.enable = true;

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

  # enable man pages
  documentation.enable = true;
  documentation.man.enable = true;
  documentation.dev.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  
  environment.interactiveShellInit = ''
    alias e='emacsclient -c -a ""'
    alias rebuild='source ~/nixos-config/init.sh'
    alias gcm='git commit --amend'
    alias gs='git status'
    alias dudh='du -d 1 -h .'
    alias vpnup='sudo openfortivpn webvpn.comp.nus.edu:443 -u e0406988 --trusted-cert d1b0a471777eaa61e2ead3f035781f9b78575c3ab267ea133647b67d34767f27'
    alias howmuchspace='sudo du -h ~ | sort -rh | head -20'
    export PATH=~/.local/bin:$PATH
  '';

  environment.systemPackages = with pkgs; [
    aseprite # pixel art
    silver-searcher # ag faster grep
    anki
    arandr # screen configuration
    awscli # aws cli
    bc # GNU calculator
    bitwarden # credentials vault
    bluejeans-gui # video conf
    chromium
    cpulimit
    cron
    bind # networks
    cacert
    dmenu
    docker
    docker-compose
    dropbox
    dunst # notification popup
    ethtool
    evtest # for testing keyboard inputs
    firefox
    ffmpeg
    file
    fzf
    ghostscript
    gimp # Image manipulation lib
    git
    gitAndTools.gh
    go
    godot # game eng
    graphviz # creating diagrams
    gparted
    gnumake # make
    gnuplot
    haskellPackages.hakyll # hakyll static site generator
    haskellPackages.xmobar # Top level install allows bin access, have to reconfig if want access within xmonad
    htop
    hugo
    imagemagick7
    inotify-tools # file watch hooks
    jekyll
    jdk11
    jetbrains.idea-community # export _JAVA_AWT_WM_NONREPARENTING=1 # use this to workaround for wm
    jq
    killall # process handling
    libnotify # send notifications
    libreoffice
    light # brightness handling
    lmms # Music production
    lsof
    minecraft
    niv
    rstudio
    tmux
    vlc
    ## libsForQt5.vlc # vlc media player
    lm_sensors
    man-pages
    man-pages-posix
    mitscheme
    ngrok
    nix-index
    nmap # Check for open ports
    nodePackages.prettier
    okular # edit pdfs
    openfortivpn # soc vpn
    nomacs # Image Viewer
    pandoc
    pciutils
    python3
    qpdf
    pdftk
    qpdfview
    rls # provides rust lang server for IDEs
    rustfmt # rust linting for emacs
    rustup # rust tool manager
    scrot # screenshot
    shellcheck
    spotify
    sshguard # protects against ssh sniffing
    steam
    tcpdump
    tdesktop # telegram
    teams # msft teams :(
    texlive.combined.scheme-full # latex
    texstudio
    tree
    tk
    unetbootin
    unzip
    vim
    wget
    wireshark
    xorg.xev
    xclip
    xorg.xkbcomp # editing keyboard configurations
    xorg.xmodmap
    yarn
    zoom-us # video conferencing tool
    zip
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
  # virtualisation.docker.enable = true;

  # enable changing screen brightness
  programs.light.enable = true;

  # Open ports in the firewall.
  # enable the following ports for syncthing
  # networking.firewall.allowedTCPPorts = [ 22000 ];
  # networking.firewall.allowedUDPPorts = [ 21027 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Use VIM as commit msg editor
  programs.vim.defaultEditor = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "22.05"; # Did you read the comment?

  # Virtual box settings
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "noel" ];
  # Virtualbox extras
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.x11 = true;

  # android dev
  # programs.adb.enable = true;
  users.users.noel.extraGroups = [ "docker" "vboxusers" "adbusers"];
}
