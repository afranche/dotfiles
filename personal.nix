{ config, pkgs, ... }:

{
  imports = [ ./common.nix ./environments/i3.nix ];

  programs.zsh.oh-my-zsh.plugins = [ "python" "dotenv" "git" "vi-mode" "tmux" ];

  home.packages = with pkgs; let
    basePkgs = import ./pkgs.nix pkgs;
  in
    basePkgs ++ [
      # Social
      riot-desktop
      discord
      skype

      # Devtools
      krita
      godot
      vscode
      docker-compose
    ];
}
