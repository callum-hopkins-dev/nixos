{
  lib,
  pkgs,
  ...
}:

{
  xdg.configFile."niri/config.kdl".text = ''
    include "/etc/niri/outputs.kdl"

    input {
        keyboard {
            xkb { layout "us"; }

            numlock
        }

        touchpad {
            tap
            natural-scroll
        }

        focus-follows-mouse max-scroll-amount="0%"
    }

    layout {
        gaps 16

        center-focused-column "never"
        background-color "transparent"

        default-column-width { proportion 1.0; }

        focus-ring { off; }
        border { off; }
        shadow { off; }
    }

    spawn-at-startup "noctalia"

    hotkey-overlay { skip-at-startup; }
    prefer-no-csd
    screenshot-path null

    window-rule {
        geometry-corner-radius 12
        clip-to-geometry true

        background-effect {
            blur true
            xray false
        }
    }

    window-rule {
      match app-id="dev.noctalia.Noctalia.Settings"
      open-floating true
      default-column-width { fixed 1080; }
      default-window-height { fixed 920; }
    }

    window-rule {
      match app-id=r#"^steam_app_.*$"#
      open-floating false
      open-fullscreen true
    }

    layer-rule {
      match namespace="^noctalia-wallpaper"
      place-within-backdrop true
    }

    layer-rule {
      match namespace="^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd)$"
      background-effect {
        xray false
      }
    }

    window-rule {
      match app-id="steam" title=r#"^notificationtoasts_\d+_desktop$"#
      default-floating-position x=10 y=10 relative-to="bottom-right"
      open-focused false
    }

    overview {
      workspace-shadow { off; }
    }

    blur {
      passes 2
      offset 3.0
      noise 0.03
      saturation 1.0
    }

    binds {
        Mod+L repeat=false { spawn "noctalia" "msg" "session" "lock"; }
        Mod+T repeat=false { spawn "kitty"; }
        Mod+Space repeat=false { spawn "noctalia" "msg" "panel-toggle" "launcher"; }

        XF86AudioRaiseVolume allow-when-locked=true { spawn "noctalia" "msg" "volume-up"; }
        XF86AudioLowerVolume allow-when-locked=true { spawn "noctalia" "msg" "volume-down"; }

        XF86AudioMute allow-when-locked=true { spawn "noctalia" "msg" "volume-mute"; }
        XF86AudioNext allow-when-locked=true { spawn "noctalia" "msg" "media" "next"; }
        XF86AudioPlay allow-when-locked=true { spawn "noctalia" "msg" "media" "toggle"; }
        XF86AudioPrev allow-when-locked=true { spawn "noctalia" "msg" "media" "previous"; }

        XF86MonBrightnessUp allow-when-locked=true { spawn "noctalia" "msg" "brightness-up"; }
        XF86MonBrightnessDown allow-when-locked=true { spawn "noctalia" "msg" "brightness-down"; }

        Mod+O repeat=false { toggle-overview; }
        Mod+Q repeat=false { close-window; }

        Mod+F { maximize-column; }
        Mod+Ctrl+F { expand-column-to-available-width; }

        Mod+Equal { set-column-width "+10%"; }
        Mod+Minus { set-column-width "-10%"; }
        Mod+Shift+Equal { set-window-height "+10%"; }
        Mod+Shift+Minus { set-window-height "-10%"; }

        Mod+WheelScrollDown { focus-workspace-down; }
        Mod+WheelScrollUp { focus-workspace-up; }
        Mod+WheelScrollLeft { focus-column-left; }
        Mod+WheelScrollRight { focus-column-right; }
        Mod+Shift+WheelScrollDown { focus-column-right; }
        Mod+Shift+WheelScrollUp { focus-column-left; }

        Print { screenshot; }
        Ctrl+Print { screenshot-screen; }
        Alt+Print { screenshot-window; }

        Mod+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }
    }

    xwayland-satellite { path "${lib.getExe pkgs.xwayland-satellite}"; }

    debug { honor-xdg-activation-with-invalid-serial; }
  '';

  home.packages = [ pkgs.xwayland-satellite ];

  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      action-double-click-titlebar = "none";
    };
  };
}
