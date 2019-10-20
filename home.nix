{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = import ./pkgs.nix pkgs;

  programs.home-manager.enable = true;
  programs.feh.enable = true;
  programs.rofi = import ./programs/rofi.nix pkgs;
  programs.zsh = import ./programs/zsh.nix;
  programs.urxvt.enable = true;  # Configured through XResources...

  services.polybar = import ./services/polybar/polybar.nix pkgs;
  services.dunst = import ./services/dunst.nix pkgs;

  xsession.windowManager.i3 = import ./i3.nix pkgs;
  gtk = import ./gtk.nix pkgs;
  xresources.properties = import ./xresources.nix pkgs;
}
