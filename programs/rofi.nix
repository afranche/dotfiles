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

  extraConfig = ''
    rofi.combi-modi: run,drun
    rofi.show-icons: true
    rofi.icon-theme: Arc
    rofi.theme: .cache/wal/colors-rofi-dark.rasi
  '';
}
