{ ... }:

{
  programs.noctalia.settings = {
    lockscreen.blur_intensity = 0.85;

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
          output = "DP-3";
          placement_width = 1920.0;
          placement_height = 1080.0;
          rotation = 0.0;
          type = "login_box";

          settings = {
            background_color = "surface_variant";
            background_opacity = 0.0;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            layout = "compact";
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = false;
            show_media = true;
            show_session_buttons = true;
            show_unlock_hint = false;
            show_weather = true;
          };
        };

        clock = {
          box_height = 128.0;
          box_width = 512.0;
          cx = 960.0;
          cy = 448.0;
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

}
