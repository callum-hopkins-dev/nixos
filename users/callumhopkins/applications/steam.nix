{ pkgs, ... }:

let
  steam' = pkgs.steam.override {
    extraArgs = "-cef-disable-gpu-compositing";
  };
in
{
  home.packages = [ steam' ];

  systemd.user.services."steam" = {
    Unit = {
      Description = "Steam";
      After = [ "graphical-session.target" ];
    };

    Service = {
      Type = "simple";
      ExecStart = "${steam'}/bin/steam -silent %U";
      ExecStop = "${steam'}/bin/steam -shutdown %U";
      Restart = "no";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
