let
  vars = import ../vars.nix;
in {
  type = "custom/text";
  content = "襤";
  content-padding = 2;
  content-background = vars.primary;
  content-foreground = vars.foreground;
  click-left = "bash ~/.config/powermenu.sh";
}
