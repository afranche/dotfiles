let
  colors = import ../../../colors.nix;
in {
  type = "internal/xbacklight";
  format = "<ramp>";
  format-padding = 2;
  format-background = colors.shade3;

  ramp-0 = "";
  ramp-1 = "";
  ramp-2 = "";
  ramp-3 = "";
  ramp-4 = "";
}
