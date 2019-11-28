pkgs: let gtk = import ../gtk.nix pkgs; in {
  enable = true;

  iconTheme = gtk.iconTheme;

  settings = let
    colors = {
      bg = "#111111";
      fg = "#dddddd";
    };
    fonts = import ../fonts.nix pkgs;
  in {
    global = rec {
      geometry = "300x5-30+62";
      transparency = 10;
      frame_color = colors.fg;
      font = "${fonts.icon.name} 12"; # Special size for dunst
      format = "%s\\n%b";
      padding = 24;
      horizontal_padding = padding;
      show-icons = "left";
    };
    urgency_low = {
      background = colors.bg;
      foreground = colors.fg;
      frame_width = 0;
      timeout = 4;
    };
    urgency_normal = {
      background = colors.bg;
      foreground = colors.fg;
      frame_width = 4;
      timeout = 10;
    };
    urgency_critical = {
      background = colors.fg;
      foreground = colors.bg;
      frame_width = 0;
      timeout = 0;
    };
  };
}
