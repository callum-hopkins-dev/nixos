{ config, ... }:

{
  programs.noctalia.settings.bar.default = {
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
}
