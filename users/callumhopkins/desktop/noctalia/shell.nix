{ config, ... }:

{
  programs.noctalia.settings = {
    shell = {
      font_family = config.stylix.fonts.monospace.name;
      corner_radius_scale = 2.0;

      time_format = "{:%H:%M}";
      date_format = "%A, %x";

      offline_mode = false;
      telemetry_enabled = false;
      setup_wizard_enabled = false;

      polkit_agent = true;

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

      launcher.categories = false;

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

    widget = {
      bluetooth.hide_when_no_connected_device = true;
      clock.format = "{:%H:%M:%S}";
      network.show_label = false;
      volume.show_label = false;
      workspaces.show_labels = false;
    };

    osd = {
      background_opacity = config.stylix.opacity.popups;
      position = "top_right";

      kinds = {
        lock_keys = true;
        media = true;
      };
    };

    notification.background_opacity = config.stylix.opacity.popups;
  };
}
