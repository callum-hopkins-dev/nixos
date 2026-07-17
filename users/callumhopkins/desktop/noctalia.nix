{
  inputs,
  config,
  ...
}:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;

    settings = {
      shell = {
        font_family = config.stylix.fonts.monospace.name;
        corner_radius_scale = 2.0;

        time_format = "{:%H:%M}";
        date_format = "%A, %x";

        offline_mode = false;
        telemetry_enabled = false;
        setup_wizard_enabled = false;

        polkit_agent = true;

        middle_click_opens_widget_settings = false;
        niri_overview_type_to_launch_enabled = true;
        screen_time_enabled = true;

        clipboard_enabled = true;
        clipboard_confirm_clear_history = false;
        clipboard_history_max_entries = 128;

        panel = {
          transparency_mode = "soft";
          borders = false;
          clipboard_position = "auto";
          control_center_placement = "floating";
          launcher_position = "auto";
          polkit_position = "top_center";
          session_placement = "floating";
          wallpaper_placement = "floating";
        };

        greeter_sync = {
          auto_sync = true;
          privilege_command = "pkexec";
        };

        launcher = {
          categories = false;
          session_search = true;
        };

        session.actions = [
          {
            action = "lock";
            countdown_seconds = 10.0;
            enabled = true;
            variant = "default";
          }

          {
            action = "logout";
            countdown_seconds = 10.0;
            enabled = true;
            variant = "default";
          }

          {
            action = "lock_and_suspend";
            countdown_seconds = 10.0;
            enabled = true;
            variant = "default";
          }

          {
            action = "reboot";
            countdown_seconds = 10.0;
            enabled = true;
            variant = "default";
          }

          {
            action = "shutdown";
            countdown_seconds = 10.0;
            enabled = true;
            variant = "destructive";
          }

          {
            action = "command";
            command = "systemctl reboot --firmware-setup";
            countdown_seconds = 10.0;
            enabled = true;
            glyph = "cpu";
            label = "Reboot into Firmware";
            variant = "default";
          }
        ];
      };

      wallpaper = {
        enabled = true;
        directory = "${config.xdg.dataHome}/wallpapers";

        transition_on_startup = true;
        transition = [ "fade" ];

        default.path = "${config.xdg.dataHome}/wallpapers/default.jpg";
      };

      idle = {
        pre_action_fade_seconds = 10.0;

        behavior_order = [
          "lock"
          "screen-off"
          "lock-and-suspend"
        ];

        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 600.0;
          };

          screen-off = {
            action = "screen_off";
            enabled = true;
            timeout = 660.0;
          };

          lock-and-suspend = {
            action = "lock_and_suspend";
            enabled = true;
            timeout = 900.0;
          };
        };
      };

      location = {
        auto_locate = false;
        address = "Pershore";
      };

      control_center = {
        hidden_tabs = [ "power" ];
        width = 1024;

        shortcuts = [
          { type = "bluetooth"; }
          { type = "caffeine"; }
          { type = "nightlight"; }
          { type = "notification"; }
          { type = "system"; }
          { type = "audio"; }
        ];
      };

      lockscreen.blur_intensity = 0.85;
      nightLight.enabled = true;

      notification.background_opacity = config.stylix.opacity.popups;

      osd = {
        background_opacity = config.stylix.opacity.popups;
        position = "top_right";

        kinds = {
          lock_keys = true;
          media = true;
        };
      };

      bar.default = {
        background_opacity = config.stylix.opacity.desktop;

        start = [
          "control-center"
          "launcher"
          "workspaces"
        ];

        end = [
          "notifications"
          "clipboard"
          "bluetooth"
          "volume"
          "battery"
          "session"
        ];

        widget_spacing = 16;
        margin_edge = 0;
        margin_ends = 8;
        radius_top_left = 0;
        radius_top_right = 0;
      };

      calender.enabled = true;

      widget = {
        bluetooth.hide_when_no_connected_device = true;
        clock.format = "{:%H:%M:%S}";
        network.show_label = false;
        volume.show_label = false;
        workspaces.display = "none";
      };

      lockscreen_widgets = {
        enabled = true;
        schema_version = 2;

        widget_order = [
          "login_box"
          "clock"
          "date"
          "weather"

          "sysmon_cpu_usage"
          "sysmon_cpu_temp"
          "sysmon_cpu_mem"
          "sysmon_gpu_usage"
        ];

        grid = {
          cell_size = 32;
          major_interval = 4;
          visible = true;
        };

        widget = {
          login_box = {
            box_height = 64.0;
            box_width = 512.0;
            cx = 960.0;
            cy = 640.0;
            output = "DP-1";
            rotation = 0.0;
            type = "login_box";

            settings = {
              background_opacity = 0.0;
              input_opacity = 1.0;
              input_radius = 6.0;
              show_login_button = true;
            };
          };

          clock = {
            box_height = 128.0;
            box_width = 512.0;
            cx = 960.0;
            cy = 448.0;
            output = "DP-1";
            rotation = 0.0;
            type = "clock";

            settings = {
              background = false;
              center_text = true;
              clock_style = "digital";
              format = "{:%H:%M:%S}";
              shadow = false;
            };
          };

          date = {
            box_height = 32.0;
            box_width = 512.0;
            cx = 960.0;
            cy = 540.0;
            output = "DP-1";
            rotation = 0.0;
            type = "clock";

            settings = {
              background = false;
              center_text = true;
              clock_style = "digital";
              format = "%A, %B %d";
              shadow = false;
            };
          };

          weather = {
            box_height = 96.0;
            box_width = 288.0;
            cx = 176.0;
            cy = 80.0;
            output = "DP-1";
            rotation = 0.0;
            type = "weather";

            settings = {
              background = false;
              color = "on_surface";
              shadow = false;
              show_forecast = false;
            };
          };

          sysmon_cpu_usage = {
            box_height = 32.0;
            box_width = 64.0;
            cx = 1760.0;
            cy = 48.0;
            output = "DP-1";
            rotation = 0.0;
            type = "sysmon";

            settings = {
              background = false;
              color = "on_surface";
              display = "gauge";
              gauge_layout = "vertical";
              shadow = false;
              show_label = false;
              stat = "cpu_usage";
            };
          };

          sysmon_cpu_temp = {
            box_height = 32.0;
            box_width = 64.0;
            cx = 1792.0;
            cy = 48.0;
            output = "DP-1";
            rotation = 0.0;
            type = "sysmon";

            settings = {
              background = false;
              color = "on_surface";
              display = "gauge";
              gauge_layout = "vertical";
              shadow = false;
              show_label = false;
              stat = "cpu_temp";
            };
          };

          sysmon_cpu_mem = {
            box_height = 32.0;
            box_width = 64.0;
            cx = 1824.0;
            cy = 48.0;
            output = "DP-1";
            rotation = 0.0;
            type = "sysmon";

            settings = {
              background = false;
              color = "on_surface";
              display = "gauge";
              gauge_layout = "vertical";
              shadow = false;
              show_label = false;
              stat = "ram_pct";
            };
          };

          sysmon_gpu_usage = {
            box_height = 32.0;
            box_width = 64.0;
            cx = 1856.0;
            cy = 48.0;
            output = "DP-1";
            rotation = 0.0;
            type = "sysmon";

            settings = {
              background = false;
              color = "on_surface";
              display = "gauge";
              gauge_layout = "vertical";
              shadow = false;
              show_label = false;
              stat = "gpu_usage";
            };
          };
        };
      };
    };
  };
}
