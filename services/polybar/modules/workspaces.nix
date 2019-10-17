let
  colors = import ../../../colors.nix;
in {
  type = "internal/i3";
  pin-workspaces = "true";
  enable-click = "true";
  enable-scroll = "true";
  format-padding = 1;

  icon-default = "";

  format = "<label-state>";
  format-background = colors.shade2;
  label-active = "";
  label-occupied = "";
  label-urgent = "";
  label-empty = "";

  label-empty-padding = 1;
  label-active-padding = 1;
  label-urgent-padding = 1;
  label-occupied-padding = 1;

  label-empty-foreground = colors.fg;
  label-active-foreground = colors.acolor;
  label-urgent-foreground = colors.curgent;
  label-occupied-foreground = colors.coccupied;
}
