pkgs: with pkgs; let
  colorVars = import ./colors.nix;
in {
  enable = true;
  package = i3-gaps;
  extraConfig = ''
    set_from_resource $foreground *.foreground #f0f0f0
    set_from_resource $background *.background #f0f0f0
    set_from_resource $primary *.color2 #f0f0f0
    set_from_resource $accent *.color3 #f0f0f0
  '';
  config = rec {
    bars = [];
    startup = [
      { command = "wal -a \"75\" -i ~/.wallpapers"; always = true; }
      { command = "systemctl --user restart polybar.service"; always = true; }
    ];
    window.titlebar = false;
    colors = rec {
      focused = {
        background = "$primary";
        border = "$primary";
        childBorder = "$primary";
        indicator = "$primary";
        text = "$foreground";
      };
      focusedInactive = {
        background = "$background";
        border = "$background";
        childBorder = "$background";
        indicator = "$background";
        text = "$foreground";
      };
      unfocused = {
        background = focusedInactive.background;
        border = focusedInactive.border;
        childBorder = focusedInactive.childBorder;
        indicator = focusedInactive.indicator;
        text = focusedInactive.text;
      };
      urgent = {
        background = "$accent";
        border = "$accent";
        childBorder = "$accent";
        indicator = "$accent";
        text = "$foreground";
      };
    };
    gaps = rec {
      inner = 24;
      outer = inner * 2;
    };
    modifier = "Mod4";
    keybindings = {
      "${modifier}+Return" = "exec urxvt";
      "${modifier}+Shift+q" = "kill";
      "${modifier}+m" = "exec ${rofi}/bin/rofi -show drun -display-drun \":\"";
      "${modifier}+Shift+m" = "exec ${rofi}/bin/rofi -display-run \":\" -show run";
      "${modifier}+v" = "exec ${betterlockscreen}/bin/betterlockscreen -l";

      "${modifier}+h" = "focus left";
      "${modifier}+j" = "focus down";
      "${modifier}+k" = "focus up";
      "${modifier}+l" = "focus right";

      "${modifier}+Shift+h" = "move left";
      "${modifier}+Shift+j" = "move down";
      "${modifier}+Shift+k" = "move up";
      "${modifier}+Shift+l" = "move right";

      "${modifier}+f" = "fullscreen toggle";

      "${modifier}+s" = "layout stacking";
      "${modifier}+w" = "layout tabbed";
      "${modifier}+e" = "layout toggle split";

      "${modifier}+Shift+space" = "floating toggle";
      "${modifier}+space" = "focus mode_toggle";

      "${modifier}+1" = "workspace 1";
      "${modifier}+2" = "workspace 2";
      "${modifier}+3" = "workspace 3";
      "${modifier}+4" = "workspace 4";
      "${modifier}+5" = "workspace 5";
      "${modifier}+6" = "workspace 6";
      "${modifier}+7" = "workspace 7";
      "${modifier}+8" = "workspace 8";
      "${modifier}+9" = "workspace 9";

      "${modifier}+Shift+1" = "move container to workspace 1";
      "${modifier}+Shift+2" = "move container to workspace 2";
      "${modifier}+Shift+3" = "move container to workspace 3";
      "${modifier}+Shift+4" = "move container to workspace 4";
      "${modifier}+Shift+5" = "move container to workspace 5";
      "${modifier}+Shift+6" = "move container to workspace 6";
      "${modifier}+Shift+7" = "move container to workspace 7";
      "${modifier}+Shift+8" = "move container to workspace 8";
      "${modifier}+Shift+9" = "move container to workspace 9";

      "${modifier}+Shift+r" = "restart";
      "${modifier}+Shift+e" = "exec i3-nagbar -t warning -m 'Do you want to exit i3?' -b 'Yes' 'i3-msg exit'";

      "${modifier}+r" = "mode resize";

      "XF86MonBrightnessUp" = "exec xbacklight -inc 5";
      "XF86MonBrightnessDown" = "exec xbacklight -dec 5";

      "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +1000";
      "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -1000";
      "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";

      "XF86AudioPlay" = "exec playerctl play-pause";
      "XF86AudioPrev" = "exec playerctl previous";
      "XF86AudioNext" = "exec playerctl next";
    };
  };
}
