{ config, pkgs, ...}:

{ 
  environment.systemPackages = [
    pkgs.emacs
  ];

  services.emacs.defaultEditor = true;
  services.emacs.enable = true;
}
