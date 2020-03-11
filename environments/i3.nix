{ pkgs, ... }:

let
  colors = {
    bg = "#111111";
    fg = "#dddddd";
  };
  font = {
    name = "Iosevka Nerd Font";
    size = "13";
    package = pkgs.nerdfonts;
  };
in {
  programs.feh.enable = true;
  services.dunst = {
    enable = true;

    iconTheme = {
      package = pkgs.arc-icon-theme;
      name = "Arc";
    };
    settings = {
      global = {
        geometry = "500x5-30+62";
        transparency = 10;
        frame_color = colors.fg;
        font = "${font.name} ${font.size}"; # Special size for dunst
        format = "%s\\n%b";
        padding = 24;
        horizontal_padding = 24;
        show-icons = "left";
        dmenu = "${pkgs.rofi}/bin/rofi -dmenu -p \"dunst:\"";
        browser = "${pkgs.chromium}/bin/chromium";
        indicate_hidden = "yes";
        show_indicators = "no";
      };
      shortcuts = {
        close_all = "mod4+p";
        context = "mod4+o";
      };
      urgency_low = {
        background = colors.bg;
        foreground = colors.fg;
        frame_width = 0;
        timeout = 4;
      };
      urgency_normal = {
        background = colors.bg;
        foreground = colors.fg;
        frame_width = 4;
        timeout = 10;
      };
      urgency_critical = {
        background = colors.fg;
        foreground = colors.bg;
        frame_width = 0;
        timeout = 0;
      };
    };
  };
  programs.rofi = {
    enable = true;
    width = 30;
    borderWidth = 0;
    padding = 10;
    fullscreen = true;

    font = "${font.name} 40";
    scrollbar = false;
    separator = "none";

    extraConfig = ''
      rofi.combi-modi: run,drun
      rofi.show-icons: true
      rofi.icon-theme: Arc
      rofi.theme: /home/tobia/.cache/wal/colors-rofi-dark.rasi
    '';
  };

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    extraConfig = ''
      set_from_resource $foreground *.foreground #f0f0f0
      set_from_resource $background *.background #f0f0f0
      set_from_resource $primary *.color2 #f0f0f0
      set_from_resource $accent *.color3 #f0f0f0
    '';
    config = rec {
      startup = [
        { command = "wal -a \"75\" -i ~/.wallpapers"; always = true; }
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
        inner = 6;
        outer = inner * 2;
      };
      modifier = "Mod4";
      keybindings = {
        "${modifier}+Return" = "exec termite";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+m" = "exec ${pkgs.rofi}/bin/rofi -show drun -display-drun \":\"";
        "${modifier}+Shift+m" = "exec ${pkgs.rofi}/bin/rofi -display-run \":\" -show run";
        "${modifier}+v" = "exec ${pkgs.betterlockscreen}/bin/betterlockscreen -l";

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

        "XF86MonBrightnessUp" = "exec ${pkgs.xorg.xbacklight}/bin/xbacklight -inc 5";
        "XF86MonBrightnessDown" = "exec ${pkgs.xorg.xbacklight}/bin/xbacklight -dec 5";
        "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +1000";
        "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -1000";
        "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
        "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
      };
    };
  };
}
