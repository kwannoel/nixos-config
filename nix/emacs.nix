{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    coreutils
    cmake
    # emacs
    ((emacsPackagesFor emacs).emacsWithPackages (epkgs: [
      epkgs.vterm
    ]))
    clang
    ripgrep
    fd
  ];

  # services.emacs.defaultEditor = true;
  # services.emacs.enable = true;
}
