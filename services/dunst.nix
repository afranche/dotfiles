pkgs: let gtk = import ../gtk.nix pkgs; in {
  enable = true;

  iconTheme = gtk.iconTheme;

  settings = let
    colors = import ../colors.nix;
    fonts = import ../fonts.nix pkgs;
  in {
    global = rec {
      geometry = "300x5-30+62";
      transparency = 10;
      frame_color = colors.shade2;
      font = "${fonts.icon.name} 8"; # Special size for dunst
      format = "%s\\n%b";
      padding = 24;
      horizontal_padding = padding;
    };
    urgency_low = {
      background = colors.bg;
      foreground = colors.fg-alt;
      frame_width = 0;
      timeout = 4;
    };
    urgency_normal = {
      background = colors.bg;
      foreground = colors.fg-alt;
      frame_width = 4;
      timeout = 10;
    };
    urgency_critical = {
      background = colors.shade2;
      foreground = colors.fg-alt;
      frame_width = 0;
      timeout = 0;
    };
  };
}
