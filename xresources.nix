pkgs: with pkgs; let
  fonts = import ./fonts.nix pkgs;
in {
  "URxvt*cursorBlink" = "true";
  "URxvt*scrollbar" = "false";
  "URxvt*font" = "xft:${fonts.primary.name}:size=${fonts.icon.size}:antialias=true";
  "URxvt*depth" = 32;
  "URxvt*internalBorder" = 25;
  "URxvt*transparency" = true;
  "URxvt*shading" = 110;

  "*.foreground" = "#ffffff";
  "*.background" = "#151515";
  "*.cursorColor" = "#ffffff";
  "*.color0" = "#151515";
  "*.color8" = "#514f4f";
  "*.color1" = "#b61c19";
  "*.color9" = "#ff3c38";
  "*.color2" = "#d0c425";
  "*.color10" = "#fef476";
  "*.color3" = "#b67621";
  "*.color11" = "#fab459";
  "*.color4" = "#d32421";
  "*.color12" = "#ff4f4c";
  "*.color5" = "#8a3d3c";
  "*.color13" = "#c17170";
  "*.color6" = "#bf2d2b";
  "*.color14" = "#ff6866";
  "*.color7" = "#d0d0d0";
  "*.color15" = "#ffffff";
}
