let
  vars = import ../vars.nix;
in {
  type = "internal/xbacklight";
  format = "<ramp>";
  format-padding = 2;
  format-background = vars.primary;

  ramp-0 = "";
  ramp-1 = "";
  ramp-2 = "";
  ramp-3 = "";
  ramp-4 = "";
}
