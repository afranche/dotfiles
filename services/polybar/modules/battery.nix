let
  vars = import ../vars.nix;
in {
  type = "internal/battery";
  battery = "BAT0";
  adapter = "ADP1";

  full-at = "98";

  poll-interval = "5";
  time-format = "%H:%M";

  format-charging-padding = 2;
  format-discharging-padding = 2;
  format-full-padding = 2;

  format-background = vars.primary;
  format-empty-background = vars.accent;

  format-charging = "<animation-charging> <label-charging>";
  format-discharging = "<animation-discharging> <label-discharging>";
  format-full = "<label-full>";
  format-charging-background = vars.primary;
  format-discharging-background = vars.primary;
  format-full-background = vars.primary;

  label-charging = "AC %percentage%%";
  label-discharging = "%percentage%%";
  label-full = "AC MAX";

  animation-charging-0 = "";
  animation-charging-1 = "";
  animation-charging-2 = "";
  animation-charging-3 = "";
  animation-charging-4 = "";
  animation-charging-framerate = "750";

  animation-discharging-0 = "";
  animation-discharging-1 = "";
  animation-discharging-2 = "";
  animation-discharging-3 = "";
  animation-discharging-4 = "";
  animation-discharging-framerate = "500";
}
