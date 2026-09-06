{ pkgs, ... }:

{
  home.packages = [ pkgs.gcc ];

  programs.noctalia.settings.plugins.enabled = [
    "alexander/game-launcher"
  ];
}
