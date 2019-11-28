let
  vars = import ../vars.nix;
in {
  type = "internal/date";
  interval = "30";
  label = "%time%";
  label-padding = 2;
  label-background = vars.primary;
  time = " %I:%M %p";
  time-alt = " %Y-%m-%d";
}
