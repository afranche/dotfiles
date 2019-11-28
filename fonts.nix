pkgs: with pkgs; {
  primary = {
    name = "Fantasque Sans Mono";
    size = "10";
    package = fantasque-sans-mono;
  };
  icon = {
    name = "Iosevka Nerd Font";
    size = "13";
    package = nerdfonts;
  };
  medieval = {
    name = "F25 BlackletterTypewriter";
    size = "17";
    package = null;  # Downloaded from dafont... May make a package for it ?
  };
}
