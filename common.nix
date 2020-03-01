{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "dotenv" "git" "vi-mode" "tmux" ];
      theme = "norm";
    };
    shellAliases = {
      e = "emacsclient";
      g = "git";
      he = "home-manager edit &";
      hs = "home-manager switch";
      ra = "ranger";
    };
    enableAutosuggestions = true;
    initExtra = ''
      case $(tty) in
        (/dev/tty[1-9]) export EDITOR="vim";;
                    (*) export EDITOR="emacs";;
      esac
    '';
  };

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Anouar Aissaoui";
    userEmail = "tobia@crossbone.cc";
    signing = {
      key = "397060522386499b2de36000649eb85d5017222f";
      signByDefault = true;
    };
  };
}