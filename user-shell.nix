{ config, pkgs, ... }:

{
  environment.shells = [pkgs.zsh];
  users.defaultUserShell = pkgs.zsh;
  users.users.noel.useDefaultShell = true;

  programs.zsh.enable = true;
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "man" ];
    theme = "bureau";
  };
}
