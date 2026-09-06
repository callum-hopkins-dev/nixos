{ config, ... }:

{
  programs.noctalia.settings = {
    bar.default = {
      background_opacity = config.stylix.opacity.desktop;

      start = [
        "control-center"
        "launcher"
        "workspaces"
      ];

      end = [
        "privacy"
        "spacer_2"
        "widget"
        "spacer_3"
        "notifications"
        "bar"
        "clipboard"
        "bluetooth"
        "volume"
        "battery"
        "session"
        "indicator"
      ];

      widget_spacing = 16;
      margin_edge = 0;
      margin_ends = 8;
      radius_top_left = 0;
      radius_top_right = 0;
    };

    widget = {
      bar = {
        show_idle_on_horizontal = false;
        type = "noctalia/timer:bar";
      };

      indicator = {
        type = "rxtsel/portctl:indicator";
      };

      spacer_2 = {
        length = 32;
        type = "spacer";
      };

      spacer_3 = {
        length = 32;
        type = "spacer";
      };

      widget = {
        capsule = true;
        type = "weinguyen/procmon:widget";
      };
    };
  };
}
