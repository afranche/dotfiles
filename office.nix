{ config, pkgs, ... }:

{
  imports = [ ./common.nix ./environments/i3.nix ];

  programs.zsh.oh-my-zsh.plugins = [ "aws" "kubectl" "go" "python" "dotenv" "git" "vi-mode" "tmux" ];

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    shutter
    tmux
    dunst
    unzip
    jetbrains.pycharm-professional
    playerctl
    htop
    emacs
    xsel
    slack
    spotify
    docker-compose
    manuskript
    rofi
    libnotify
    zoom-us
    pavucontrol
    pywal
    ripgrep
    ranger
    chromium
    rambox
    keybase
    riot-desktop
    discord
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
  ];
}
