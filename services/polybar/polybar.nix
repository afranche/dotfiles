pkgs: with pkgs; rec {
  enable = true;
  package = polybar.override {
      i3GapsSupport = true;
      pulseSupport = true;
  };
  script = ''
    polybar main -c ~/.config/polybar/config &
  '';
  config = let
    fonts = import ../../fonts.nix pkgs;
    vars = import ./vars.nix;
  in {
    "bar/main" = {
      width = "100%";
      height = vars.barHeight;
      fixed-center = "true";
      tray-position = "center";
      tray-detached = "false";
      line-size = "2";
      background = vars.background;
      foreground = vars.foreground;
      font-0 = "${fonts.primary.name}:pixelsize=${fonts.primary.size};3";
      font-1 = "${fonts.icon.name}:pixelsize=${fonts.icon.size};3";
      cursor-click = "pointer";
      cursor-scroll = "ns-resize";
      scroll-up = "i3wm-wsnext";
      scroll-down = "i3wm-wsprev";
      modules-left = "workspaces backlight";
      modules-right = "volume battery date menu";
    };
    "module/workspaces" = import ./modules/workspaces.nix;
    "module/backlight" = import ./modules/backlight.nix;
    "module/battery" = import ./modules/battery.nix;
    "module/volume" = import ./modules/volume.nix;
    "module/date" = import ./modules/date.nix;
    "module/menu" = import ./modules/menu.nix;
  };
}
