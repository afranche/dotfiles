{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs = {
    home-manager.enable = true;
    emacs.enable = true;
    zsh = {
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
        if [[ ! -z "''${IN_NIX_SHELL}" ]] && [[ -f shell.nix ]]; then
          $(nix-shell --command zsh)
        fi
        case $(tty) in
          (/dev/tty[1-9]) export EDITOR="vim";;
                      (*) export EDITOR="emacs";;
        esac
      '';
    };
    git = {
      enable = true;
      userName = "Anouar Aissaoui";
      userEmail = "tobia@crossbone.cc";
      signing = {
        key = "397060522386499b2de36000649eb85d5017222f";
        signByDefault = true;
      };
    };
  };

  services = {
    emacs.enable = true;
    keybase.enable = true;
  };
}
