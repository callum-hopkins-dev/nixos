{ ... }:

{
  programs.noctalia.settings = {
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

    nightlight.enabled = true;
  };
}
