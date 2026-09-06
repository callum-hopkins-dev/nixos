{ ... }:

{
  programs.noctalia.settings = {
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

      calendar.show_week_numbers = true;
    };

    location = {
      auto_locate = false;
      address = "Pershore";
    };

    calendar.enabled = true;
  };
}
