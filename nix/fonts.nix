{ config, pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    packages = with pkgs; [
      iosevka
      emacs-all-the-icons-fonts
      source-code-pro
      source-sans-pro
      source-serif-pro
      etBook
      oxygenfonts
      vistafonts
      ia-writer-duospace
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
       monospace = [ "Iosevka" ];
       sansSerif = [ "Source Sans Pro" ];
       serif = [ "Source Serif Pro" ];
      };
    };
  };
}
