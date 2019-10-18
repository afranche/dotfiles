let
  colors = import ../../../colors.nix;
in {
  type = "internal/i3";
  pin-workspaces = "true";
  enable-click = "true";
  enable-scroll = "true";
  format-padding = 1;

  ws-icon-default = "";

  format = "<label-state>";
  format-background = colors.shade2;

  label-mode = "%mode%";
  label-focused = "";
  label-visible = "";
  label-urgent = "";
  label-unfocused = "";

  label-focused-padding = 1;
  label-visible-padding = 1;
  label-urgent-padding = 1;
  label-unfocused-padding = 1;
}
