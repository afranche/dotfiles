pkgs: let
  fonts = import ../fonts.nix pkgs;
in {
  enable = true;
  font = "${fonts.icon.name} ${fonts.icon.size}";
  mouseAutohide = true;
  scrollOnOutput = false;
  scrollbar = "off";
  colorsExtra = ''
    foreground      = #ffffff
    foreground_bold = #ffffff
    cursor          = #ffffff
    background      = #000000a0

    # black
    color0  = #1c1c1c
    color8  = #3d3a3a

    # red
    color1  = #d770af
    color9  = #d28abf

    # green
    color2  = #9acc79
    color10 = #8fb676

    # yellow
    color3  = #d0d26b
    color11 = #c8bc45

    # blue
    color4  = #77b6c5
    color12 = #8fa7b9

    # magenta
    color5  = #a488d9
    color13 = #bd89de

    # cyan
    color6  = #7fcab3
    color14 = #6ec2a8

    # white
    color7  = #8d8d8d
    color15 = #dad3d3
  '';
}
