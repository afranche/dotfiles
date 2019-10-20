let
  colors = import ../../../colors.nix;
in {
  type = "custom/text";
  content = "襤";
  content-padding = 2;
  content-background = colors.primary;
  content-foreground = colors.fg;
  click-left = "bash ~/.config/powermenu.sh";
}
