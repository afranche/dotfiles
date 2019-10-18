pkgs: let
  colors = import ../colors.nix;
  fonts = import ../fonts.nix pkgs;
  polybarVars = import ../services/polybar/vars.nix;
in {
  enable = true;
  width = 30;
  borderWidth = 0;
  padding = 10;
  location = "top-right";
  yoffset = polybarVars.barHeight;

  font = "${fonts.icon.name} ${fonts.icon.size}";
  scrollbar = false;
  separator = "none";

  colors = {
    window = {
      background = colors.bg;
      border = colors.bg;
      separator = colors.bg;
    };
    rows = {
      normal = {
        background = colors.bg;
        foreground = colors.fg-alt;
        backgroundAlt = colors.bg;
        highlight = {
          background = colors.shade2;
          foreground = colors.fg-alt;
        };
      };
    };
  };
  extraConfig = ''
    rofi.combi-modi: run,drun
    rofi.show-icons: true
    rofi.icon-theme: Arc
  '';
}
