{ config, pkgs, ... }:

{
  imports = [ ./common.nix ./environments/i3.nix ];

  programs.zsh.oh-my-zsh.plugins = [ "aws" "kubectl" "go" "python" "dotenv" "git" "vi-mode" "tmux" ];

  home.packages = with pkgs; let
    basePkgs = import ./pkgs.nix pkgs;
  in
    basePkgs ++ [
      # Social
      slack
      rambox
      zoom-us

      # Devtools
      jetbrains.pycharm-professional
      docker-compose
      postman
      aws-iam-authenticator

      # Kubernetes
      kubectl
      minikube
      podman
      cri-o
    ];
}
