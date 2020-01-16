{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    coreutils
    cmake
    # emacs
    ((emacsPackagesNgGen emacs).emacsWithPackages (epkgs: [
      epkgs.emacs-libvterm
    ]))
    clang
    ripgrep
    fd
  ];

  services.emacs.defaultEditor = true;
  services.emacs.enable = true;
}
