{ pkgs, config, ... }:

let
  steam' = pkgs.steam.override {
    extraProfile = ''
      export HOME="${config.xdg.dataHome}/steam"

      export XDG_CONFIG_HOME="$HOME/.config"
      export XDG_DATA_HOME="$HOME/.local/share"
      export XDG_CACHE_HOME="$HOME/.cache"
      export XDG_STATE_HOME="$HOME/.local/state"

      mkdir -p "$HOME" \
        "$XDG_CONFIG_HOME" \
        "$XDG_DATA_HOME" \
        "$XDG_CACHE_HOME" \
        "$XDG_STATE_HOME"
    '';

    extraArgs = "-cef-disable-gpu-compositing";
  };
in
{
  home.packages = [ steam' ];

  home.sessionSearchVariables.XDG_DATA_DIRS = [
    "${config.xdg.dataHome}/steam/.local/share"
  ];

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
