{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    jetbrains.pycharm-community
    chromium
    riot-desktop
    quassel
    franz
    tmux
    git
    zoom-us
    pavucontrol
    spotify
    docker-compose
    kubectl
    awscli
    gnumake
    postman
    xsel
  ];

  gtk = with pkgs; {
    enable = true;
    theme = {
      package = adapta-gtk-theme;
      name = "Adapta";
    };
    iconTheme = {
      package = arc-icon-theme;
      name = "Arc";
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "19.09";
}
