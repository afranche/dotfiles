let
  vars = import ../vars.nix;
in {
  type = "internal/pulseaudio";
  format-volume = "<ramp-volume> <label-volume>";
  format-volume-padding = 2;
  format-volume-background = vars.primary;
  label-volume = "%percentage%%";
  label-muted = "婢";
  label-muted-background = vars.primary;
  label-muted-padding = 2;

  ramp-volume-0 = "奄";
  ramp-volume-1 = "奄";
  ramp-volume-2 = "奔";
  ramp-volume-3 = "奔";
  ramp-volume-4 = "墳";
  ramp-volume-5 = "墳";
  ramp-volume-6 = "墳";
}
