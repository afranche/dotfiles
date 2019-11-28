{
  enable = true;
  oh-my-zsh = {
    enable = true;
    plugins = [ "aws" "dotenv" "kubectl" "git" "vi-mode" "tmux" ];
    theme = "norm";
  };
  shellAliases = {
    e = "emacs &";
    g = "git";
    he = "home-manager edit &";
    hs = "home-manager switch";
  };
  enableAutosuggestions = true;
  initExtra = ''
    case $(tty) in
      (/dev/tty[1-9]) export EDITOR="vim";;
                  (*) export EDITOR="emacs";;
    esac
  '';
}
