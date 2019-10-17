pkgs: with pkgs; {
  enable = true;
  theme = {
    package = adapta-gtk-theme;
    name = "Adapta";
  };
  iconTheme = {
    package = numix-icon-theme-square;
    name = "Numix Square";
  };
  font = let
    fonts = import ./fonts.nix pkgs;
  in {
    package = fonts.primary.package;
    name = "${fonts.primary.name} ${fonts.primary.size}";
  };
  gtk3.extraCss = ''
    VteTerminal {
      -VteTerminal-inner-border: 40px;
    }
  '';
}
