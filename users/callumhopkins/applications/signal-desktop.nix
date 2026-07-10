{ pkgs, ... }:

{
  home.packages = [ pkgs.signal-desktop ];

  systemd.user.services."signal-desktop" = {
    Unit = {
      Description = "Signal Desktop Messenger";
      After = [ "graphical-session.target" ];
    };

    Service = {
      Type = "simple";
      Environment = "DISPLAY=:0";
      ExecStart = "${pkgs.signal-desktop}/bin/signal-desktop --start-in-tray";
      Restart = "on-failure";
      RestartSec = 5;
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
